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
        
        let nums = Int.uniqueRandomNumbers(in: 1...45, count: 7)
        
        for (index,label) in labels.enumerated(){
            if label == labels.last{
                label.setLottoNumber(nums[index], with: .purple,textColor: .white)
            }else{
                label.setLottoNumber(nums[index])
            }
        }
    }
}

