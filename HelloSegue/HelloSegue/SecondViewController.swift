//
//  SecondViewController.swift
//  HelloSegue
//
//  Created by 김상준 on 6/24/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func unwindToSecond(_ unwindSegue: UIStoryboardSegue) {
        print(#function, type(of: unwindSegue.source), "=>", type(of: unwindSegue.destination))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
