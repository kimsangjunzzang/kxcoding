//
//  ViewController.swift
//  Lotto
//
//  Created by 김상준 on 6/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var number1Label: UILabel!
    @IBOutlet weak var number2Label: UILabel!
    @IBOutlet weak var number3Label: UILabel!
    @IBOutlet weak var number4Label: UILabel!
    @IBOutlet weak var number5Label: UILabel!
    @IBOutlet weak var number6Label: UILabel!
    @IBOutlet weak var number7Label: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        number1Label.layer.cornerRadius = number1Label.bounds.width / 2
        number1Label.clipsToBounds = true
        
        number2Label.layer.cornerRadius = number2Label.bounds.width / 2
        number2Label.clipsToBounds = true
        
        number3Label.layer.cornerRadius = number3Label.bounds.width / 2
        number3Label.clipsToBounds = true
        
        number4Label.layer.cornerRadius = number4Label.bounds.width / 2
        number4Label.clipsToBounds = true
        
        number5Label.layer.cornerRadius = number5Label.bounds.width / 2
        number5Label.clipsToBounds = true
        
        number6Label.layer.cornerRadius = number6Label.bounds.width / 2
        number6Label.clipsToBounds = true
        
        number7Label.layer.cornerRadius = number7Label.bounds.width / 2
        number7Label.clipsToBounds = true
    }


}

