//
//  Event.swift
//  Days
//
//  Created by 김상준 on 7/2/24.
//

import UIKit

struct Event {
    let date: Date
    let title: String
    
    let backgroundColor: UIColor
    let textColor: UIColor
    let icon: String
    
    var daysString: String? {
        guard let day = date.days(from: Date.today) else { return nil }
        
        if day >= 0 {
            return "D-\(abs(day))"
        }else {
            return "D+\(abs(day))"
        }
    }
}
