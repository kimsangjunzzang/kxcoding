//
//  ViewController.swift
//  HelloOperation
//
//  Created by 김상준 on 7/15/24.
//

import UIKit

class ViewController: UIViewController {
    
    let queue = OperationQueue()
    var isCancelled = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startOperation(_ sender: Any) {
        queue.addOperation {
            for _ in 1...30 {
                guard !self.isCancelled else { return }
                print("🍏",separator: " ",terminator: " ")
                Thread.sleep(forTimeInterval: 0.3)
            }
        }
        
        let op = BlockOperation {
            for _ in 1...30 {
                guard !self.isCancelled else { return }
                print("🍎",separator: " ",terminator: " ")
                Thread.sleep(forTimeInterval: 0.6)
            }
        }
        queue.addOperation(op)
        
        op.addExecutionBlock {
            for _ in 1...30 {
                guard !self.isCancelled else { return }
                print("🥕",separator: " ",terminator: " ")
                Thread.sleep(forTimeInterval: 0.5)
            }
        }
        
        let op2 = EmojiPrintOperation(type: "🗓️")
        queue.addOperation(op2)
        
        op2.completionBlock = {
            print("Done")
        }
    }
    
    @IBAction func cancelOperation(_ sender: Any) {
        isCancelled.toggle()
        queue.cancelAllOperations()
    }
}

