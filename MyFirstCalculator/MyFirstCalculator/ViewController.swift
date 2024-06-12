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
    
    @IBOutlet weak var operatorButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func calculate(_ sender: Any) {
        guard let text = firstOperandField.text, let a = Int(text) else{
            return
        }
        guard let text = secondOperandField.text, let b = Int(text) else{
            return
        }
        guard  let op = operatorButton.title(for: .normal)else{
            return
        }
        
        var result : Int? = nil
        switch op {
        case "+":
            result = a + b
            
        case "-":
            result = a - b
            
        case "*":
            result = a * b
            
        case "/":
            result = a / b
            
        default:
            break
        }
        guard let result else{return}
        resultLabel.text = String(result)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectOperator(_ sender: Any) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let plusAction = UIAlertAction(title: "+ (더하기)", style: .default) { _  in
            self.operatorButton.setTitle("+", for: .normal)
        }
        actionSheet.addAction(plusAction)
        
        let minusAction = UIAlertAction(title: "- (빼기)", style: .default) { _ in
            self.operatorButton.setTitle("-", for: .normal)
        }
        actionSheet.addAction(minusAction)
        
        let multiplyAction = UIAlertAction(title: "* (곱하기)", style: .default) { _ in
            self.operatorButton.setTitle("*", for: .normal)
            
        }
        actionSheet.addAction(multiplyAction)
        
        let divideAction = UIAlertAction(title: "/ (나누기)", style: .default) { _  in
            self.operatorButton.setTitle("/", for: .normal)
            
        }
        actionSheet.addAction(divideAction)
        
        present(actionSheet,animated: true)
    }
    
}

