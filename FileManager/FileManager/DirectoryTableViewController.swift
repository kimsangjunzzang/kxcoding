//
//  DirectoryTableViewController.swift
//  FileManager
//
//  Created by 김상준 on 7/25/24.
//
import UIKit

class DirectoryTableViewController: UITableViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var currentDirectoryUrl: URL?
    var contents = [Content]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "directorySegue" {
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
                if let vc = segue.destination as? DirectoryTableViewController {
                    vc.currentDirectoryUrl = contents[indexPath.row].url
                }
            }
        } else if segue.identifier == "textSegue" {
            if let vc = segue.destination.children.first as? TextViewController {
                vc.url = sender as? URL
            }
        }
        else if segue.identifier == "imageSegue" {
            if let vc = segue.destination.children.first as? ImageViewController {
                vc.url = sender as? URL
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?
    ) -> Bool {
        if identifier == "directorySegue" {
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
                let url = contents[indexPath.row].url
                let reachable = (try? url.checkResourceIsReachable()) ?? true
                if !reachable { return false }
                return contents[indexPath.row].type == .directory
            }
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if currentDirectoryUrl == nil {
            currentDirectoryUrl = URL(fileURLWithPath: NSHomeDirectory())
        }
        setupMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshContents()
        updateNavigationTitle()
    }
    
    func showNameInputAlert() {
        let inputAlert = UIAlertController(title: "새 디렉토리",
                                           message: nil,
                                           preferredStyle: .alert)
        inputAlert.addTextField{ nameField in
            nameField.placeholder = "디렉토리 이름을 입력해 주세요"
            nameField.clearButtonMode = .whileEditing
            nameField.autocapitalizationType = .none
            nameField.autocorrectionType = .no
        }
        let createAction = UIAlertAction(title: "추가",style: .default) { _ in
            if let name = inputAlert.textFields?.first?.text {
                self.addDirectory(named: name)
            }
        }
        inputAlert.addAction(createAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        inputAlert.addAction(cancelAction)
        
        present(inputAlert, animated: true)
    }
    
    func addDirectory(named: String) {
        guard let url = currentDirectoryUrl?.appendingPathComponent(named, isDirectory: true) else { return }
        try? FileManager.default.createDirectory(at: url, withIntermediateDirectories: true,attributes: nil)
        refreshContents()
    }
    
    func addTextFile() {
        let content = Date.now.description
        guard let targetUrl = currentDirectoryUrl?.appendingPathComponent("current-time").appendingPathExtension("txt") else { return }
        try? content.write(to: targetUrl, atomically: true, encoding: .utf8)
        refreshContents()
    }
    
    func addImageFile() {
        let name = Int.random(in: 1...30)
        guard let imageUril = URL(string: "https://kxcodingblob.blob.core.windows.net/mastering-ios/\(name).jpg") else { return }
        guard let targetUrl = currentDirectoryUrl?.appendingPathComponent("\(name)").appendingPathExtension("jpg") else { return }
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageUril)
            try? data?.write(to: targetUrl,options: .atomic)
            
            DispatchQueue.main.async {
                self.refreshContents()
            }
        }
        
    }
    
    func setupMenu() {
        menuButton.menu = UIMenu(children: [
            UIAction(title: "새 디렉토리",image: UIImage(systemName: "folder"), handler: { _ in
                self.showNameInputAlert()
            }),
            UIAction(title: "새 텍스트 파일", image: UIImage(systemName: "doc.text"), handler: { _ in
                self.addTextFile()
            }),
            UIAction(title: "새 이미지 파일", image: UIImage(systemName: "photo"), handler: { _ in
                self.addImageFile()
            })
        ])
    }
    
    func removeItem(at url: URL) -> Bool {
        do {
            try FileManager.default.removeItem(at: url)
            return true
        } catch {
            print(error)
        }
        return false
    }
    
    func renameItem(at index: Int, to title: String) {
        do {
            let target = contents[index]
            
            switch target.type {
            case .directory:
                let toUrl = target.url.deletingLastPathComponent().appendingPathComponent(title)
                try FileManager.default.moveItem(at: target.url, to: toUrl)
            case .file:
                let ext = target.url.pathExtension
                let toUrl = target.url.deletingLastPathComponent().appendingPathComponent(title).appendingPathExtension(ext)
                try FileManager.default.moveItem(at: target.url, to: toUrl)
            }
            refreshContents()
        } catch {
            print (error)
        }
    }
    
    func showRenameAlert(at index: Int) {
        let inputAlert = UIAlertController(title: "이름 바꾸기",
                                           message: nil,
                                           preferredStyle: .alert)
        inputAlert.addTextField{ nameField in
            nameField.placeholder = "이름을 입력해 주세요"
            nameField.clearButtonMode = .whileEditing
            nameField.autocapitalizationType = .none
            nameField.autocorrectionType = .no
        }
        let createAction = UIAlertAction(title: "확인",style: .default) { _ in
            if let name = inputAlert.textFields?.first?.text {
                self.renameItem(at: index, to: name)
            }
        }
        inputAlert.addAction(createAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        inputAlert.addAction(cancelAction)
        
        present(inputAlert, animated: true)
    }

    
    func updateNavigationTitle() {
        guard let url = currentDirectoryUrl else {
            navigationItem.title = "???"
            return
        }
        let values = try? url.resourceValues(forKeys: [.localizedNameKey])
        navigationItem.title = values?.localizedName
        
        
        //        do {
        //            let values = try url.resourceValues(forKeys: [.localizedNameKey])
        //            navigationItem.title = values.localizedName
        //        } catch {
        //            print(error)
        //        }
        
    }
    
    func refreshContents() {
        contents.removeAll()
        
        defer {
            tableView.reloadData()
        }
        guard let url = currentDirectoryUrl else {
            fatalError("empty url")
        }
        
        let properties: [URLResourceKey] = [.localizedNameKey,.isDirectoryKey,.fileSizeKey,.isExcludedFromBackupKey]
        
        guard let currentContentUrls = try? FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: properties, options: FileManager.DirectoryEnumerationOptions.skipsHiddenFiles) else { print("try? 부분"); return }
        
        for url in currentContentUrls  {
            let content = Content(url: url)
            contents.append(content)
        }
        
        contents.sort {
            if $0.type == $1.type {
                return $0.name.lowercased() < $1.name.lowercased()
            }
            return $0.type.rawValue < $1.type.rawValue
        }
        
        if contents.isEmpty {
            let label = UILabel(frame: .zero)
            label.text = "빈 디렉토리"
            label.textAlignment = .center
            label.textColor = .secondaryLabel
            tableView.backgroundView = label
        } else {
            tableView.backgroundView = nil
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let target = contents[indexPath.row]
        cell.imageView?.image = target.image
        
        switch target.type {
        case .directory:
            cell.textLabel?.text = "[\(target.name)]"
            cell.detailTextLabel?.text = nil
            cell.accessoryType = .disclosureIndicator
        case .file:
            cell.textLabel?.text = target.name
            cell.detailTextLabel?.text = target.sizeString
            cell.accessoryType = .none
        }
        
        if target.isExcludedFromBackup {
            cell.textLabel?.textColor = .secondaryLabel
        } else {
            cell.textLabel?.textColor = .label
        }
        cell.detailTextLabel?.textColor = cell.textLabel?.textColor
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // 회색 뜨는거 제거한다.
        let target = contents[indexPath.row]
        guard target.type == .file else { return }
        switch target.url.pathExtension {
        case "txt": performSegue(withIdentifier: "textSegue", sender: target.url)
        case "jpg","png":
            performSegue(withIdentifier: "imageSegue", sender: target.url)
        default:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let target = contents[indexPath.row]
            
            if removeItem(at: target.url) {
                contents.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let renameAction = UIContextualAction(style: .normal, title: "이름 바꾸기") { action, view, completion in
            self.showRenameAlert(at: indexPath.row)
            completion(true)
        }
        
        
        renameAction.backgroundColor = .systemBlue
        renameAction.image = UIImage(systemName: "square.and.pencil")
        
        let target = contents[indexPath.row]
        
        let backupAction = UIContextualAction(style: .normal, title: nil) { action, view, completion in
            target.toggleBackupFlag()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
            
            completion(true)
        }
        
        if target.isExcludedFromBackup {
            backupAction.image = UIImage(systemName: "icloud.and.arrow.up")
        } else {
            backupAction.image = UIImage(systemName: "icloud.slash")
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [backupAction,renameAction])
        return configuration
    }
}
