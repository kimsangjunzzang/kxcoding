//
//  ViewController.swift
//  MyFirstCalculator
//
//  Created by 김상준 on 6/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstOperandField: UITextField!
    
    @IBOutlet weak var secondOperandField: UITextField!
    
    var selectedOperator : Operator?
    
    @IBOutlet weak var operatorButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstOperandField.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        firstOperandField.becomeFirstResponder() // 들어가자마자 입력가능하게 만드는 기능
    }
    
    @IBAction func selectOperator(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let plusAction = UIAlertAction(title: "+ (더하기)", style: .default) { _  in
            self.operatorButton.setTitle("+", for: .normal)
            self.selectedOperator = .plus
        }
        actionSheet.addAction(plusAction)
       
        let minusAction = UIAlertAction(title: "- (빼기)", style: .default) { _ in
            self.operatorButton.setTitle("-", for: .normal)
            self.selectedOperator = .minus
        }
        actionSheet.addAction(minusAction)
        
        let multiplyAction = UIAlertAction(title: "* (곱하기)", style: .default) { _ in
            self.operatorButton.setTitle("*", for: .normal)
            self.selectedOperator = .multiply
            
        }
        actionSheet.addAction(multiplyAction)
        
        let divideAction = UIAlertAction(title: "/ (나누기)", style: .default) { _  in
            self.operatorButton.setTitle("/", for: .normal)
            self.selectedOperator = .divide
            
        }
        actionSheet.addAction(divideAction)
        
        present(actionSheet,animated: true)
    }
    
    @IBAction func calculate(_ sender: Any) {
        guard let text = firstOperandField.text, let a = Int(text) else{
            firstOperandField.becomeFirstResponder()
            showAlert("값을 입력해 주세요","오류")
            return
        }
        
        guard let text = secondOperandField.text, let b = Int(text) else{
            secondOperandField.becomeFirstResponder()
            showAlert("값을 입력해 주세요")
            return
        }
        
        guard  let op = selectedOperator else {
            showAlert("연산자를 선택해 주세요")
            return
        }
        
        var result : Int? = nil
        
        switch op {
        
        case .plus:
            result = a + b
            
        case .minus:
            result = a - b
            
        case .multiply:
            result = a * b
            
        case .divide:
            result = a / b
        }
        guard let result else{return}
        resultLabel.text = String(result)
        
        if firstOperandField.isFirstResponder{
            firstOperandField.resignFirstResponder()

        }
        if secondOperandField.isFirstResponder{
            secondOperandField.resignFirstResponder()
        }
                
    }
    
    func showAlert(_ message : String,_ title: String = "알림"){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: title, style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

 // MARK: 텍스트 필드에 숫자만 입력 가능하도록 만드는 함수
extension ViewController : UITextFieldDelegate{
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        
        guard !string.isEmpty else {return true}         // 3번째 인자가 비어있을 경우 true 리턴
        guard let _ = Int(string) else {return false}    // INT로 받을 수 없는 string이 입력 될경우 false 리턴
        
        return true
    }
}
