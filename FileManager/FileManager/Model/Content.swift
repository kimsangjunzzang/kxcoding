//
//  Content.swift
//  FileManager
//
//  Created by 김상준 on 7/25/24.
//

import UIKit

struct Content {
    let url: URL
    
    var name: String {
        return ""
    }
    var size: Int {
        return 0
    }
    var type: Type {
        return .file
    }
    var image: UIImage? {
        switch type {
            
        case .directory:
            return UIImage(systemName: "folder")
        case .file:
            let ext = url.pathExtension
            
            switch ext {
                
            case "txt":
                return UIImage(systemName: "doc.text")
            case "jpg","png":
                return UIImage(systemName: "doc.richtext")
            default:
                return UIImage(systemName: "doc")
            }
        }
    }
}
