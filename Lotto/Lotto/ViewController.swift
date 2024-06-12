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
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let labels = [number1Label!,number2Label!,number3Label!,number4Label!,number5Label!,number6Label!,number7Label!]
        
        var nums = [Int]()
        while nums.count < labels.count {
            
            let rnd = Int.random(in: 1...45)
            if !nums.contains(rnd){
                nums.append(rnd)
            }
            
        }
        let sortedNums = nums.sorted()
        
        for (index,label) in labels.enumerated(){
            label.layer.cornerRadius = label.bounds.width / 2
            label.clipsToBounds = true
            
            label.text = String(sortedNums[index])
            
            switch sortedNums[index] {
            case 1...10:
                label.backgroundColor = UIColor.yellow
                label.textColor = UIColor.black
            case 11...20:
                label.backgroundColor = UIColor.blue
                label.textColor = UIColor.white
            case 21...30:
                label.backgroundColor = UIColor.red
                label.textColor = UIColor.white
            case 31 ... 40:
                label.backgroundColor = UIColor.gray
                label.textColor = UIColor.white
            case 41 ... 45:
                label.backgroundColor = UIColor.green
                label.textColor = UIColor.black
            default:
                break
                
            }
            
        }
        
        number7Label.backgroundColor = UIColor.purple
        number7Label.textColor = UIColor.white
    }
    
    
}

