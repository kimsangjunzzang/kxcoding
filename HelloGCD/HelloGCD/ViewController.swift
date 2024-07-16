//
//  ViewController.swift
//  HelloGCD
//
//  Created by 김상준 on 7/16/24.
//

import UIKit

class ViewController: UIViewController {
    
    let serialQueue = DispatchQueue(label: "SerialQueue")
    let concurrentQueue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sync(_ sender: Any) {
        concurrentQueue.sync {
            for _ in 0 ..< 3 {
                print("Hello")
            }
            print("# Point 1")
        }
        print("# Point 2")
    }
    
    @IBAction func async(_ sender: Any) {
        concurrentQueue.async {
            for _ in 0 ..< 3 {
                print("Hello")
            }
            print("# Point 1")
        }
        print("# Point 2")
    }
    
    @IBAction func delay(_ sender: Any) {
        let delay = DispatchTime.now() + 10
        
        concurrentQueue.asyncAfter(deadline: delay) {
            print("# Point 1")
        }
        print("# Point 2")
    }
    
    @IBAction func concurrent(_ sender: Any) {
        var start = Date.now
        for index in 0 ..< 50 {
            print(index, terminator: " ")
            Thread.sleep(forTimeInterval: 0.1)
        }
        var end = Date.now
        print("serial: \(end.timeIntervalSinceReferenceDate - start.timeIntervalSinceReferenceDate)")
        
        start = Date.now
        DispatchQueue.concurrentPerform(iterations: 50) { index in
                print(index, terminator: " ")
                Thread.sleep(forTimeInterval: 0.1)
        }
        end = Date.now
        print("serial: \(end.timeIntervalSinceReferenceDate - start.timeIntervalSinceReferenceDate)")
        
    }
    
   
    
    
}

