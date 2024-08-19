//
//  MemoEntity+CoreDataProperties.swift
//  Memo
//
//  Created by 김상준 on 8/20/24.
//
//

import Foundation
import CoreData


extension MemoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemoEntity> {
        return NSFetchRequest<MemoEntity>(entityName: "Memo")
    }

    @NSManaged public var content: String?
    @NSManaged public var insertData: Date?

}

extension MemoEntity : Identifiable {

}
