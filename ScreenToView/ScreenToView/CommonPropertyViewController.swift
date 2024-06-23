//
//  CommonPropertyViewController.swift
//  ScreenToView
//
//  Created by 김상준 on 6/24/24.
//

import UIKit

class CommonPropertyViewController: UIViewController {

    
    @IBOutlet weak var toggleSwitch: UISwitch!
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var alphaSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let imgView = view.viewWithTag(100) as? UIImageView {
            imgView.isHidden = !toggleSwitch.isOn
            imgView.alpha = CGFloat(alphaSlider.value)
            
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func alphaChanged(_ sender: Any) {
        imageView.alpha = CGFloat(alphaSlider.value)
    }
    
    
    @IBAction func toggleHidden(_ sender: Any) {
        imageView.isHidden = !toggleSwitch.isOn
    }
}
