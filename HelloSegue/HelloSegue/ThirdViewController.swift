//
//  ThirdViewController.swift
//  HelloSegue
//
//  Created by 김상준 on 6/24/24.
//

import UIKit

class ThirdViewController: UIViewController {
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print(type(of: self), #function)
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(type(of: self), #function)
    }
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        print(type(of: self), #function)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   

}
