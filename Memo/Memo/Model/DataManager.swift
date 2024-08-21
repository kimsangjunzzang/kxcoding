//
//  DataManager.swift
//  Memo
//
//  Created by 김상준 on 8/20/24.
//

import Foundation
import CoreData

class DataManager {
    static let shared = DataManager()
    
    private init() {
        
    }
    
    var list = [MemoEntity]()
    
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Memo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    func insertDummyData() {
#if DEBUG
        let countRequest = MemoEntity.fetchRequest()
        
        do {
            let count = try mainContext.count(for: countRequest)
            if count > 0 {
                return
            }
        } catch {
            print (error)
        }
        
        
        guard let path = Bundle.main.path(forResource: "lipsum", ofType: "txt") else {
            return
        }
        do {
            let source = try String(contentsOfFile: path)
            
            let sentences = source.components(separatedBy: .newlines).filter {
                $0.trimmingCharacters(in: .whitespacesAndNewlines).count > 0
            }
            
            var dataList = [[String: Any]]()
            
            for sentence in sentences {
//                let memo = MemoEntity(context: mainContext)
//                memo.content = sentence
//                memo.insertDate = Date(timeIntervalSinceNow: Double.random(in: 0 ... 3600 * 24 * 30) * -1)
                
                dataList.append([
                    "content": sentence,
                    "insertDate": Date(timeIntervalSinceNow: Double.random(in: 0 ... 3600 * 24 * 30) * -1)
                ])
            }
            let insertRequest = NSBatchInsertRequest(entityName: "Memo", objects: dataList)
            
            if let result = try mainContext.execute(insertRequest) as? NSBatchInsertResult, let succeeded = result.result as? Bool {
                if succeeded {
                    print("Batch Insert 성공")
                } else {
                    print("Batch Insert 실패")
                }
            }
            
            saveContext()
        } catch {
            print(error)
        }
#endif
    }
    
    
    func fetch() {
        let request = MemoEntity.fetchRequest()
        
        let sortByDataDesc = NSSortDescriptor(key: "insertDate", ascending: false)
        request.sortDescriptors = [sortByDataDesc]
        
        do {
            list = try mainContext.fetch(request)
        } catch {
            print(error)
        }
    }
}
