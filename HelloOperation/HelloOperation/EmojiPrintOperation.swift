//
//  EmojiPrintOperation.swift
//  HelloOperation
//
//  Created by 김상준 on 7/15/24.
//

import Foundation

class EmojiPrintOperation: Operation {
    let type: String
    
    init(type: String) {
        self.type = type
    }
    
    override func main() {
        for _ in 1...30 {
            guard !isCancelled else { return }
            print(type,separator: " ",terminator: " ")
            Thread.sleep(forTimeInterval: 0.9)
        }
    }
}
