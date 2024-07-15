//
//  PhotoDataSource.swift
//  HelloOperation
//
//  Created by 김상준 on 7/15/24.
//

import Foundation
import UIKit

struct PhotoDataSource {
    var list: [PhotoData]
    
    init() {
        var list = [PhotoData]()
        
        for num in 1 ... 20 {
            let url = "https://kxcodingblob.blob.core.windows.net/mastering-ios/\(num).jpg"
            let data = PhotoData(url: url)
            list.append(data)
        }
        self.list = list
    }
}
