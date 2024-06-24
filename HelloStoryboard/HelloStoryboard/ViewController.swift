//
//  ViewController.swift
//  HelloStoryboard
//
//  Created by 김상준 on 6/24/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func presentInitialVC(_ sender: Any) {
        let vc = storyboard?.instantiateInitialViewController()
        
        if let vc {
            present(vc,animated: true)
        }
    }
    
    @IBAction func presentVC(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "blueVC") else {return}
        
        present(vc,animated: true)
    }
    
    @IBAction func presentYellowVC(_ sender: Any) {
        
        let subStoryboard = UIStoryboard(name: "Sub", bundle: nil) // 서브스토리 보드를 직접 만들어야 한다.
        let vc = subStoryboard.instantiateViewController(identifier: "yellowVC")
        
        present(vc,animated: true)
        
    }
    
    
    
}

