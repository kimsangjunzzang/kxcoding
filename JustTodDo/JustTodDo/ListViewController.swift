//
//  ViewController.swift
//  JustTodDo
//
//  Created by 김상준 on 6/20/24.
//

import UIKit

class ListViewController: UIViewController {
    
    var toDoList = [String]()
    
    @IBOutlet weak var toDoTableView: UITableView! // 자동으로 언래핑 되는 io
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination.children.first as? AddViewController {
            vc.listVC = self
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


extension ListViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
    
    
}

