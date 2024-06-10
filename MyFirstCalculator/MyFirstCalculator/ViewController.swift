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
    
    @IBAction func selectOperator(_ sender: Any) {
    }
    
    @IBOutlet weak var operatorButton: UIButton!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func calculate(_ sender: Any) {
        let a = Int(firstOperandField.text!)!
        let b = Int(secondOperandField.text!)!
        
        let result = a + b
        resultLabel.text = String(result)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

