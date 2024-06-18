//
//  Extension.swift
//  Lotto
//
//  Created by 김상준 on 6/18/24.
//

import Foundation

extension Int {
    static func uniqueRandomNumbers(in range: ClosedRange<Int>,count: Int) -> [Int]{
        var nums = [Int]()
        while nums.count < count {
            
            let rnd = Int.random(in: 1...45)
            if !nums.contains(rnd){
                nums.append(rnd)
            }
            
        }
        nums.sort()
        
        return nums
    }
    
}
