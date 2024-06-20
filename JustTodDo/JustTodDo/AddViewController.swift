//
//  AddViewController.swift
//  JustTodDo
//
//  Created by 김상준 on 6/20/24.
//

import UIKit

class AddViewController: UIViewController {
    
    var listVC: ListViewController? // 커플링, 결합도 ( 강한 의존 )
    
    @IBOutlet weak var inputField: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: Any) {
        guard let text = inputField.text else {return}
        
        listVC?.toDoList.append(text)
        listVC?.toDoTableView.reloadData() // 테이블 뷰에 데이터 변경을 알려준다
        
        dismiss(animated: true)
        
    }
    

    
}
