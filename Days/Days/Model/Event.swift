//
//  Event.swift
//  Days
//
//  Created by 김상준 on 7/2/24.
//

import UIKit
import Foundation

struct Event {
    
    enum Category: String, CaseIterable {
        case birthday
        case business
        case diet
        case wedding
        case travel
        case exam
        case love
        case soccer
        case baseball
        case basketball
        
        var title: String {
            switch self {
            case .birthday:
                return "생일"
            case .business:
                return "업무"
            case .diet:
                return "다이어트"
            case .wedding:
                return "결혼"
            case .travel:
                return "여행"
            case .exam:
                return "시험"
            case .love:
                return "연애"
            case .soccer:
                return "축구"
            case .baseball:
                return "야구"
            case .basketball:
                return "농구"
            }
        }
    }
    
    let date: Date
    let title: String
    
    let backgroundColor: UIColor
    let textColor: UIColor
    let category: Category
    
    let daysString: String?
    let dateString: String?
    let iconImage: UIImage?
    
    init(
        date: Date,
        title: String,
        backgroundColor: UIColor,
        textColor: UIColor,
        category: Category
    ) {
        self.date = date
        self.title = title
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.category = category
        
        switch category {
        case .birthday:
            if let day = date.upcommingBirthDay.days(from: Date.today) {
                daysString =  if day >= 0 {
                    "D-\(abs(day))"
                } else {
                    "D+\(abs(day))"
                }
            } else {
                daysString = nil
            }

        default:
            if let day = date.days(from: Date.today) {
                daysString =  if day >= 0 {
                    "D-\(abs(day))"
                } else {
                    "D+\(abs(day))"
                }
            } else {
                daysString = nil
            }

            
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        dateString = formatter.string(from: date)
        
        iconImage = UIImage(named: category.rawValue)
    }
    
    init(data: ComposeData) {
        self.init(
            date: data.date!,
            title: data.title!,
            backgroundColor: data.backgroundColor!,
            textColor: data.textColor!,
            category: data.category!
        )
    }
    
}

var events = [
    Event(
        date: Date(year: 2002, month: 5, day: 31),
        title: "한일 월드컵",
        backgroundColor: .systemBlue,
        textColor: .white,
        category: .soccer
    ),
    Event(
        date: Date(year: 1999, month: 7, day: 1),
        title: "생일",
        backgroundColor: .systemBlue,
        textColor: .white,
        category: .birthday
    ),
    Event(
        date: Date(year: 2022, month: 11, day: 20),
        title: "카타르 월드컵",
        backgroundColor: .brown,
        textColor: .white,
        category: .soccer
    ),
    Event(
        date: Date(year: 2026, month: 6, day: 11),
        title: "북중미 월드컵",
        backgroundColor: .green,
        textColor: .black,
        category: .soccer
    ),
]
