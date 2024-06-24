//
//  ValueViewController.swift
//  HelloSegue
//
//  Created by 김상준 on 6/25/24.
//

import UIKit

class ValueViewController: UIViewController {

    var value: String?
    
    
    @IBOutlet weak var valueField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        value = valueField.text
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
