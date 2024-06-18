//
//  ViewController.swift
//  SimpleList
//
//  Created by 김상준 on 6/18/24.
//

import UIKit

class ViewController: UIViewController{
    
    let fruits = ["Apple","Banana","Orange"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate  {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return fruits.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        // #1
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // #2
        cell.textLabel?.text = fruits[indexPath.row]
        
        // #3
        return cell
    }
    
}
