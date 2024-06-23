//
//  ViewController.swift
//  ScreenToView
//
//  Created by 김상준 on 6/24/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print( UIScreen.main.bounds)
        print (view.window?.windowScene?.screen.bounds)
        
        if let screen = view.window?.windowScene?.screen {
            let width = screen.bounds.size.width * screen.scale // 스크린의 최적화 된 값을 구할 수 있다.
            let height = screen.bounds.size.height * screen.scale
            
        }
       
    }
    
    @IBAction func test(_ sender: Any) {
    }
    
}



/*
 1. viewDidLoad는 뷰가 표시되기 전에 호출된다.
 2. 뷰를 표시할려면 window가 필요하다
 3. window에 뷰를 추가하면 화면에 표시된다.
 4. 뷰가 window에 추가되기 전까지는 화면에 표시되지 않고, window 속성에 접근하면 nil을 리턴한다.
 
 
 View Controller 마다 Root View가 하나씩 있다.
 Root View에는 view 속성으로 접근할 수 있다.
 스토리보드에서 추가하는 뷰는 Root View 아래쪽에 추가된다.
 
 뷰 컨트롤러는 UIViewController 클래스로 구현되어 있다.
 화면을 구현할 때는 새로운 클래스를 만들고 UIViewController를 상속한 다음 원하는 기능을 추가하는 방식으로 구현한다.
 */
