//
//  ViewController.swift
//  HelloSegue
//
//  Created by 김상준 on 6/24/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    
    
    
    

    @IBAction func performSegueManually(_ sender: Any) {
        performSegue(withIdentifier: "manualSegue", sender: nil)
    }
    
    
    
}

