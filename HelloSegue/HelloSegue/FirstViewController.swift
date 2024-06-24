//
//  FirstViewController.swift
//  HelloSegue
//
//  Created by 김상준 on 6/24/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func unwindToFisrt(_ unwindSegue: UIStoryboardSegue) {
        print(#function, type(of: unwindSegue.source), "=>", type(of: unwindSegue.destination))
        
        if let vc = unwindSegue.source as? ValueViewController, let value = vc.valueField.text, let img = UIImage(systemName: value) { imageView.image = img
            
        }
    }
    
    override func canPerformUnwindSegueAction(_ action: Selector, from fromViewController: UIViewController, sender: Any?) -> Bool {
        print(type(of: self), #function)
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
