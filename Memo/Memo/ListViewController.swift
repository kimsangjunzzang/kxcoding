//
//  ViewController.swift
//  Memo
//
//  Created by 김상준 on 8/14/24.
//

import UIKit

class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataManager.shared.fetch()
    }


}

extension ListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let target = DataManager.shared.list[indexPath.row]
        cell.textLabel?.text = target.content
        cell.detailTextLabel?.text = target.insertDate?.description
        
        return cell
    }
    
    
}

