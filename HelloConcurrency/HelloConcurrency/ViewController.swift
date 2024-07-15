//
//  ViewController.swift
//  HelloConcurrency
//
//  Created by 김상준 on 7/15/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var countLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func start(_ sender: Any) {
        
        DispatchQueue.global().async {
            for num in 1...100 {
                DispatchQueue.main.async{
                    self.countLabel.text = "\(num)"
                }
                Thread.sleep(forTimeInterval: 0.1)
            }
            
        }
    }
    
}

