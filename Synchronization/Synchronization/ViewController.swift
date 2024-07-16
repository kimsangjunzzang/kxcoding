//
//  ViewController.swift
//  Synchronization
//
//  Created by 김상준 on 7/16/24.
//

import UIKit

class ViewController: UIViewController {
    
    var value = 0
    
    let firstQueue = DispatchQueue(label: "First",attributes: .concurrent)
    let secondQueue = DispatchQueue(label: "Second",attributes: .concurrent)
    
    let syncQueue = DispatchQueue(label: "Sync")
    
    let group = DispatchGroup()
    
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func start(_ sender: Any) {
        value = 0
        
        for _ in 1...1000 {
            firstQueue.async(group: group) {
                self.syncQueue.sync {
                    self.value += 1 // Critical Section
                }
            }
            
            // Race Condition
            
            secondQueue.async(group: group) {
                self.syncQueue.sync {
                    self.value += 1 // Critical Section
                }
            }
        }
        group.notify(queue: .main) {
            self.valueLabel.text = "\(self.value)"
        }
    }
    
    let lock = NSLock()
    
    @IBAction func mutex(_ sender: Any) {
        value = 0
        
        for _ in 1...1000 {
            firstQueue.async(group: group) {
                self.lock.lock()
                self.value += 1
                self.lock.unlock()
            }
            
            // Race Condition
            
            secondQueue.async(group: group) {
                self.lock.lock()
                self.value += 1
                self.lock.unlock()
            }
        }
        
        group.notify(queue: .main) {
            self.valueLabel.text = "\(self.value)"
        }
    }
    let sem = DispatchSemaphore(value: 1)
    
    @IBAction func semaphore(_ sender: Any) {
        value = 0
        
        for _ in 1...1000 {
            firstQueue.async(group: group) {
                self.sem.wait()
                self.value += 1
                self.sem.signal()
            }
            
            // Race Condition
            
            secondQueue.async(group: group) {
                self.sem.wait()
                self.value += 1
                self.sem.signal()
            }
        }
        
        group.notify(queue: .main) {
            self.valueLabel.text = "\(self.value)"
        }
    }
    
    
}

