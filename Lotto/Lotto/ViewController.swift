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
        
        let rnd1 = Int.random(in: 1...45)
        number1Label.text = String(rnd1)
        
        switch rnd1 {
        case 1...10:
            number1Label.backgroundColor = UIColor.yellow
            number1Label.textColor = UIColor.black
        case 11...20:
            number1Label.backgroundColor = UIColor.blue
            number1Label.textColor = UIColor.white
        case 21...30:
            number1Label.backgroundColor = UIColor.red
            number1Label.textColor = UIColor.white
        case 31 ... 40:
            number1Label.backgroundColor = UIColor.gray
            number1Label.textColor = UIColor.white
        case 41 ... 45:
            number1Label.backgroundColor = UIColor.green
            number1Label.textColor = UIColor.black
        default:
            break
            
        }
        
        let rnd2 = Int.random(in: 1...45)
        number2Label.text = String(rnd2)
        switch rnd2 {
        case 1...10:
            number2Label.backgroundColor = UIColor.yellow
            number2Label.textColor = UIColor.black
        case 11...20:
            number2Label.backgroundColor = UIColor.blue
            number2Label.textColor = UIColor.white
        case 21...30:
            number2Label.backgroundColor = UIColor.red
            number2Label.textColor = UIColor.white
        case 31 ... 40:
            number2Label.backgroundColor = UIColor.gray
            number2Label.textColor = UIColor.white
        case 41 ... 45:
            number2Label.backgroundColor = UIColor.green
            number2Label.textColor = UIColor.black
        default:
            break
            
        }
        let rnd3 = Int.random(in: 1...45)
        number3Label.text = String(rnd3)
        switch rnd3 {
        case 1...10:
            number3Label.backgroundColor = UIColor.yellow
            number3Label.textColor = UIColor.black
        case 11...20:
            number3Label.backgroundColor = UIColor.blue
            number3Label.textColor = UIColor.white
        case 21...30:
            number3Label.backgroundColor = UIColor.red
            number3Label.textColor = UIColor.white
        case 31 ... 40:
            number3Label.backgroundColor = UIColor.gray
            number3Label.textColor = UIColor.white
        case 41 ... 45:
            number3Label.backgroundColor = UIColor.green
            number3Label.textColor = UIColor.black
        default:
            break
            
        }
        let rnd4 = Int.random(in: 1...45)
        number4Label.text = String(rnd4)
        switch rnd4 {
        case 1...10:
            number4Label.backgroundColor = UIColor.yellow
            number4Label.textColor = UIColor.black
        case 11...20:
            number4Label.backgroundColor = UIColor.blue
            number4Label.textColor = UIColor.white
        case 21...30:
            number4Label.backgroundColor = UIColor.red
            number4Label.textColor = UIColor.white
        case 31 ... 40:
            number4Label.backgroundColor = UIColor.gray
            number4Label.textColor = UIColor.white
        case 41 ... 45:
            number4Label.backgroundColor = UIColor.green
            number4Label.textColor = UIColor.black
        default:
            break
            
        }
        let rnd5 = Int.random(in: 1...45)
        number5Label.text = String(rnd5)
        switch rnd5 {
        case 1...10:
            number5Label.backgroundColor = UIColor.yellow
            number5Label.textColor = UIColor.black
        case 11...20:
            number5Label.backgroundColor = UIColor.blue
            number5Label.textColor = UIColor.white
        case 21...30:
            number5Label.backgroundColor = UIColor.red
            number5Label.textColor = UIColor.white
        case 31 ... 40:
            number5Label.backgroundColor = UIColor.gray
            number5Label.textColor = UIColor.white
        case 41 ... 45:
            number5Label.backgroundColor = UIColor.green
            number5Label.textColor = UIColor.black
        default:
            break
            
        }
        let rnd6 = Int.random(in: 1...45)
        number6Label.text = String(rnd6)
        switch rnd6 {
        case 1...10:
            number6Label.backgroundColor = UIColor.yellow
            number6Label.textColor = UIColor.black
        case 11...20:
            number6Label.backgroundColor = UIColor.blue
            number6Label.textColor = UIColor.white
        case 21...30:
            number6Label.backgroundColor = UIColor.red
            number6Label.textColor = UIColor.white
        case 31 ... 40:
            number6Label.backgroundColor = UIColor.gray
            number6Label.textColor = UIColor.white
        case 41 ... 45:
            number6Label.backgroundColor = UIColor.green
            number6Label.textColor = UIColor.black
        default:
            break
            
        }
        let rnd7 = Int.random(in: 1...45)
        number7Label.text = String(rnd7)
        number7Label.backgroundColor = UIColor.purple
        number7Label.textColor = UIColor.white
        
        // 1 ~ 10 : 노란색
        // 11 ~ 20 : 파란색
        // 21 ~ 30 : 빨간색
        // 31 ~ 30 : 회색
        // 나머지 : 녹색
        // 보너스 번호 : 보라색
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
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

