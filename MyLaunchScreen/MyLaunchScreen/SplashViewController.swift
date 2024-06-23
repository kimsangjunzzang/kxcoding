//
//  SplashViewController.swift
//  MyLaunchScreen
//
//  Created by 김상준 on 6/23/24.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.performSegue(withIdentifier: "replaceSegue", sender: nil)
        }

        // Do any additional setup after loading the view.
    }
   
}
