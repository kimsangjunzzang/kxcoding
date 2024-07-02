//
//  ButtonViewController.swift
//  Constraint
//
//  Created by 김상준 on 7/2/24.
//

import UIKit

class ButtonViewController: UIViewController {

    @IBOutlet weak var buttonWidth: NSLayoutConstraint!
    
    
    @IBOutlet weak var buttonHeight: NSLayoutConstraint!
    
    @IBOutlet weak var buttonTrailingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var buttonLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var animateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonChange(_ sender: Any) {
        buttonBottomConstraint.constant = view.frame.height / 2

        
    }
    
}
