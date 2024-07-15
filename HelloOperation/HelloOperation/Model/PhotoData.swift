//
//  PhotoData.swift
//  HelloOperation
//
//  Created by 김상준 on 7/15/24.
//

import UIKit

class PhotoData {
    let url: URL
    var data: UIImage?
    
    init(url: String) {
        self.url = URL(string: url)!
    }
}
