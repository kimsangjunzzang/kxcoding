//
//  ViewController.swift
//  Login
//
//  Created by 김상준 on 6/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var idField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func login(_ sender: Any) {
        let id = idField.text!
        let password = passwordField.text!

        
        guard !id.isEmpty && !password.isEmpty else{
            print("계정을 입력하세요")
            return
        }
        
        if id == "kxcoding" && password == "1234"{
                resultLabel.text = "로그인 성공"
        }else{
            resultLabel.text = "로그인 실패"
        }
        
        
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

