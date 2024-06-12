//
//  ViewController.swift
//  Login
//
//  Created by 김상준 on 6/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var idField: UITextField! //IUO
    
    @IBOutlet weak var passwordField: UITextField!
        
    @IBOutlet weak var resultLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        idField.becomeFirstResponder()
    }
    
    @IBAction func login(_ sender: Any) {
        guard let id = idField.text, !id.isEmpty else{
            showAlert("아이디를 입력해 주세요")
            return
        }
        
        guard let password = passwordField.text, !password.isEmpty else{
            showAlert("비밀번호를 입력해 주세요")
            return
        }
        if id == "kxcoding" && password == "1234"{
                resultLabel.text = "로그인 성공"
        }else{
            resultLabel.text = "로그인 실패"
        }
        
        
    }
    func showAlert(_ message : String){
        let alert = UIAlertController(title: "확인", message: "\(message)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
        
    }


}

