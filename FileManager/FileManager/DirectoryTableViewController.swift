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
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            if let vc = segue.destination as? DirectoryTableViewController {
                vc.currentDirectoryUrl = contents[indexPath.row].url
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "drectorySegue" {
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
                
                do {
                    let url = contents[indexPath.row].url
                    let reachable = try url.checkResourceIsReachable()
                    if !reachable {
                        return false
                    }
                } catch {
                    print(error)
                    return false
                }
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
        let inputAlert = UIAlertController(title: "새 디렉토리", message: nil, preferredStyle: .alert)
        inputAlert.addTextField{ nameField in
            nameField.placeholder = "디렉토리 이름을 입력해 주세요"
            nameField.clearButtonMode = .whileEditing
            nameField.autocapitalizationType = .none
            nameField.autocorrectionType = .no
        }
        let createAction = UIAlertAction(title: "추가", style: .default) { _ in
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
        guard let url = currentDirectoryUrl?.appendingPathComponent(named, isDirectory: true) else {
            return
        }
        do {
            try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true,attributes: nil)
        } catch {
            print(error)
        }
        refreshContents()
    }
    func setupMenu() {
        menuButton.menu = UIMenu(children: [
            UIAction(title: "새 디렉토리",image: UIImage(systemName: "folder"), handler: { _ in
                self.showNameInputAlert()
            }),
            UIAction(title: "새 텍스트 파일", image: UIImage(systemName: "doc.text"), handler: { _ in
                
            }),
            UIAction(title: "새 이미지 파일", image: UIImage(systemName: "photo"), handler: { _ in
                
            })
        ])
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
            cell.detailTextLabel?.text = "\(target.size)"
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
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
