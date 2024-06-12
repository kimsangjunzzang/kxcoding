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
    
    @IBOutlet var labels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
       
        coordinator.animate { _ in
            for label in self.labels{
                label.layer.cornerRadius = label.bounds.width / 2
                label.clipsToBounds = true
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var nums = [Int]()
        while nums.count < labels.count {
            
            let rnd = Int.random(in: 1...45)
            if !nums.contains(rnd){
                nums.append(rnd)
            }
            
        }
        
        nums.sort()
        
        
        for (index,label) in labels.enumerated(){
            label.layer.cornerRadius = label.bounds.width / 2
            label.clipsToBounds = true
            
            label.text = String(nums[index])
            
            label.backgroundColor = getColors(from: nums[index]).backgroundColor
            label.textColor = getColors(from: nums[index]).textColor
        }
        
        let colors = getColors(from: nil)
        number7Label.backgroundColor = colors.backgroundColor
        number7Label.textColor = colors.textColor
    }
    
    func getColors(from number: Int?) -> (backgroundColor: UIColor,textColor: UIColor){
        
        guard let number else{
            return (UIColor.purple, UIColor.white)
        }
        
        switch number{
        case 1...10:
            return (UIColor.yellow,UIColor.black)
        case 11...20:
            return (UIColor.blue,UIColor.white)
        case 21...30:
            return (UIColor.red,UIColor.white)
        case 31 ... 40:
            return (UIColor.gray,UIColor.white)
        case 41 ... 45:
            return (UIColor.green,UIColor.black)
        default:
            return (UIColor.purple,UIColor.white)
            
        }
    }
}

