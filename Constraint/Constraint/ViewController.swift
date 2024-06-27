//
//  ViewController.swift
//  Constraint
//
//  Created by 김상준 on 6/27/24.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var leftEqualWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var leftCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var rightCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var rightEqualWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func selectLeft(_ sender: Any) {
        leftCenterXConstraint.priority = UILayoutPriority.defaultHigh
        leftEqualWidthConstraint.priority = .defaultHigh
        
        rightCenterXConstraint.priority = .defaultLow
        rightEqualWidthConstraint.priority = .defaultLow
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func selectRight(_ sender: Any) {
        
        leftCenterXConstraint.priority = .defaultLow
        leftEqualWidthConstraint.priority = .defaultLow
        
        rightCenterXConstraint.priority = .defaultHigh
        rightEqualWidthConstraint.priority = .defaultHigh
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

