//
//  ViewController.swift
//  JustToDo2
//
//  Created by 김상준 on 6/21/24.
//

import UIKit

class ListViewController: UIViewController {
    
    var toDoList = [String]()

    @IBOutlet weak var toDoTableView: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
extension ListViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
        
        
    }
}

