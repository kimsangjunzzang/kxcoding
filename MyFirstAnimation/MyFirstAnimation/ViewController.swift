//
//  ViewController.swift
//  MyFirstAnimation
//
//  Created by 김상준 on 6/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var boxView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func moveBox(_ sender: Any) {
        
        UIView.animate(withDuration: 0.3){
            self.boxView.frame = CGRect(x: 200, y: 400, width: 200, height: 200)
            self.boxView.backgroundColor = UIColor.yellow
        } completion: { _ in
            print("애니메이션 종료")
        }
    }
    //멀티플 트레일링 클로져
    //마지막 부분에 트레일링 클로져가 모여있는게 아니면 중간에 있는 클로저는 인라인 클로져로 된다.
}

