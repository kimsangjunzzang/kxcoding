//
//  ThirdViewController.swift
//  HelloSegue
//
//  Created by 김상준 on 6/24/24.
//

import UIKit

class ThirdViewController: UIViewController {
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        
    }
    
    @IBAction func unwindToThird(_ unwindSegue: UIStoryboardSegue) {
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   

}
