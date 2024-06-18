//
//  ViewController.swift
//  HelloScope
//
//  Created by 김상준 on 6/18/24.
//

import UIKit

// 1. Global Scope
let g1 = 123
let g3 = g2

class ViewController: UIViewController {
    
    //6 선언 스코프, 타입 스코프
    var a = g1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 3. Local Scope
        
        let local1 = 123
        print(g1) // 123
        
        let g1 = 789
        print(g1) // 789
        print(g2)
        
        if true {
            // 4
            let local3 = 123
            print(local1)
        }
        
        // 5
        let local2 = 456
        
    }
    
    
    func doSomething(value: Int?){
        //
        //        if let local1 = value{
        //            print(local1)
        //        }
        //        guard let value else{
        //            return
        //        }
        //
        //        guard let local2 = value else{
        //            return
        //        }
        //
        //        for num in 1 ... 100 {
        //            print(num)
        //
        //        }
        //
        //        print(value)
        
    }
}


// 2
let g2 = 456

/*
 #1 동일한 Scope에 접근할 수 있다.
 #2 Global Scope에서는 선언 순서에 상관없이 어디에서나 접근할 수 있다.
 #3 Local Scope에서 상위 Scope나 Global Scope에 접근할 수 있다.
 #4 Global Scope가 아니라면 이미 선언되어 있는 요소에만 접근할 수 있다.
 #5 상위 Scope는 하위 Scope에 접근할 수 없다.
 #6 서로 다른 Scope에 동일한 이름이 존재한다면 가장 가까운 (계층과 선언 시점 고려) Scope에 있는 이름을 사용한다.
 #7 Global Scope가 아닌 다른 모든 스코프는 시작과 끝이 명확해야 한다.
 */
