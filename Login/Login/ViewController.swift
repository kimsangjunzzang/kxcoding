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
    
    @IBOutlet weak var loginButton: UIButton!
    
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

extension ViewController : UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        
        var finalId = idField.text ?? ""
        var finalPassword = passwordField.text ?? ""
        
        if textField == idField {
            guard let range = Range(range, in: finalId) else {
                return true
            }
            finalId = finalId.replacingCharacters(in: range, with: string)
            
        }else if textField == passwordField {
            guard let range = Range(range, in: finalPassword) else {
                return true
            }
            finalPassword = finalPassword.replacingCharacters(in: range, with: string)
        }
        
        loginButton.isEnabled = !finalId.isEmpty && !finalPassword.isEmpty
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == idField {
            let cnt = textField.text?.count ?? 0
            let isValidId = (6 ... 12).contains(cnt)
            
            textField.layer.borderWidth = isValidId ? 0 : 1
            textField.layer.borderColor = isValidId ? nil : UIColor.red.cgColor
            textField.layer.cornerRadius = isValidId ? 0: 5
            textField.tintColor = isValidId ? view.tintColor : .red
           
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case idField:
            passwordField.becomeFirstResponder()
        case passwordField:
            login(self)
        default:
            break
        }
        return false // false 를 통해 텍스트 필드의 기본 동작(줄 바꿈 삽입)을 막고 있다.
    }
}
