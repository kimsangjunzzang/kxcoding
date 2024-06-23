//
//  SecondViewController.swift
//  ScreenToView
//
//  Created by 김상준 on 6/24/24.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBAction func closeVC(_ sender: Any) {
        dismiss(animated: true)
    }

    override func viewDidLoad() {
        // 한번만 실행하면 되는거다
        super.viewDidLoad()
        print(self, #function, presentingViewController, presentedViewController)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(self, #function, presentingViewController, presentedViewController)
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        
        print(self, #function, presentingViewController, presentedViewController)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print(self, #function, presentingViewController, presentedViewController)
       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print(self, #function, presentingViewController, presentedViewController)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print(self, #function, presentingViewController, presentedViewController)
    }
    
    // Deinitailzer, 소멸자
    deinit {
        print(self, #function, presentingViewController, presentedViewController)
    }
    

}
