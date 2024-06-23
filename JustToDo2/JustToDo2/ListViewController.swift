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
    
    // 이렇게 하면 listviewcontroller 가 addviewcontroller의 delegate가 된다.
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination.children.first as? AddViewController {
//            vc.delegate = self
//        }
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name("toDoDidInsert"), object: nil, queue: .main) { noti in
            if let todo = noti.userInfo?["todo"] as? String{
                self.toDoList.append(todo)
                self.toDoTableView.reloadData()
            }
        }
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

//extension ListViewController : TodoDelegate {
//    
//    func addViewController(_ vc: UIViewController, didInsert todo: String) {
//        toDoList.append(todo)
//        toDoTableView.reloadData()
//    }
//// 선택적 맴버일 경우 필요하지 않을시 사용하지 않을 수 있다.
////    func addViewControllerDidCancel(_ vc: UIViewController) {
////        
////    }
//    
//}
