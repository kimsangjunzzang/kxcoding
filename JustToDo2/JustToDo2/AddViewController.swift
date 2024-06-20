//
//  AddViewController.swift
//  JustToDo2
//
//  Created by 김상준 on 6/21/24.
//

import UIKit

class AddViewController: UIViewController {
    
//    weak var delegate

    
    @IBOutlet weak var inputField: UITextField!
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func save(_ sender: Any) {
        guard let text = inputField.text else {return}
        
        dismiss(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
