//
//  MemoEntity+CoreDataClass.swift
//  Memo
//
//  Created by 김상준 on 8/20/24.
//
//

import Foundation
import CoreData

fileprivate let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    formatter.doesRelativeDateFormatting = true // 날짜를 오늘 이나 어제로 표현 가능합니다.
    return formatter
}()

@objc(MemoEntity)
public class MemoEntity: NSManagedObject {
    var dateString: String? {
        return formatter.string(for: insertDate)
    }

}
