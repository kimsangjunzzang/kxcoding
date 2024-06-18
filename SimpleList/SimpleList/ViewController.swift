//
//  ViewController.swift
//  SimpleList
//
//  Created by 김상준 on 6/18/24.
//

import UIKit

class ViewController: UIViewController{
    
    let fruits = ["Apple","Banana","Orange"]
    let languages = ["Swift","Objective-C","C#","Java","HTML"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ViewController: UITableViewDataSource{
    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        print("#3",#function)
        return 2
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        print("#1",#function, section)
        
        switch section {
        case 0:
            return fruits.count
        case 1:
            return languages.count
        default:
            return 0
        }
    }
    
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        print("#2",#function, indexPath)
        // #1
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // #2
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = fruits[indexPath.row]
        case 1:
            cell.textLabel?.text = languages[indexPath.row]
        default:
            break
            
        }
        // #3
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        switch section {
        case 0:
            return "좋아하는 과일"
        case 1:
            return "사용할 수 있는 언어"
        default:
            return nil
        }
    }
    func tableView(
        _ tableView: UITableView,
        titleForFooterInSection section: Int
    ) -> String? {
        switch section {
        case 1:
            return "\(languages.count)개의 언어를 사용할 수 있습니다."
        default:
            return nil
        }
    }
    
}

extension ViewController: UITableViewDelegate  {
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        switch indexPath.section {
        case 0:
            print(fruits[indexPath.row])
        case 1:
            print(languages[indexPath.row])
        default:
            break
            
        }
        
    }
    
}
