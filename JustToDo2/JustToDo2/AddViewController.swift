//
//  AddViewController.swift
//  JustToDo2
//
//  Created by 김상준 on 6/21/24.
//

import UIKit

// 전역 상수로 선언 -> 코드의 가독성과 재사용성을 해치게 된다.
//let toDoKey = "todo"

enum Key {
    case todo
}


class AddViewController: UIViewController {
    
//    weak var delegate: TodoDelegate?

    @IBOutlet weak var inputField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        
//        delegate?.addViewControllerDidCancel?(self) // 선택적 메소드가 되었기 때문에 ? 넣어준다.
        dismiss(animated: true)
    }
    
    
    @IBAction func save(_ sender: Any) {
        guard let text = inputField.text else {return}
//        delegate?.addViewController(self, didInsert: text)
        
        let center = NotificationCenter.default
        center.post(name: .toDoDidInsert, object: nil, userInfo: [Key.todo: text])
        dismiss(animated: true)
    }

}
