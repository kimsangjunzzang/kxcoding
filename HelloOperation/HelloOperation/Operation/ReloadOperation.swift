//
//  ReloadOperation.swift
//  HelloOperation
//
//  Created by 김상준 on 7/16/24.
//

import Foundation
import UIKit

class ReloadOperation: Operation {
    weak var collectionView: UICollectionView!
    var indexPath: IndexPath?
    
    init(collectionView: UICollectionView!, indexPath: IndexPath? = nil) {
        self.collectionView = collectionView
        self.indexPath = indexPath
        
        super.init()
    }
    
    override func main() {
        print(self,"Start",indexPath)
        
        defer {
            if isCancelled {
                print(self,"Cancelled",indexPath)
            } else {
                print(self,"Done",indexPath)
            }
        }
        guard Thread.isMainThread else {
            fatalError()
        }
        
        guard !isCancelled else {
            print(self,"Cancelled")
            return
        }
        
        if let indexPath {
            if collectionView.indexPathsForVisibleItems.contains(indexPath) {
                collectionView.reloadItems(at: [indexPath])
            }
        } else {
            collectionView.reloadData()
        }
    }
    
    override func cancel() {
        super.cancel()
        
        print(self,"Cancel")
        
    }
}
