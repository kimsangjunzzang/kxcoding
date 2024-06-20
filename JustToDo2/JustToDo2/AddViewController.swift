//
//  AddViewController.swift
//  JustToDo2
//
//  Created by 김상준 on 6/21/24.
//

import UIKit

class AddViewController: UIViewController {
    
    weak var delegate: TodoDelegate?

    @IBOutlet weak var inputField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        
        delegate?.addViewControllerDidCancel?(self) // 선택적 메소드가 되었기 때문에 ? 넣어준다.
        dismiss(animated: true)
    }
    
    
    @IBAction func save(_ sender: Any) {
        guard let text = inputField.text else {return}
        delegate?.addViewController(self, didInsert: text)
        dismiss(animated: true)
    }

}
