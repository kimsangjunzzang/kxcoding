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
        let values = try? url.resourceValues(forKeys: [.localizedNameKey])
        return values?.localizedName ?? "???"
    }
    
    var size: Int {
        let values = try? url.resourceValues(forKeys: [.fileSizeKey])
        return values?.fileSize ?? 0
    }
    
    var type: Type {
        let values = try? url.resourceValues(forKeys: [.isDirectoryKey])
        return values?.isDirectory == true ? .directory : .file
    }
    
    var isExcludedFromBackup: Bool {
        let values = try? url.resourceValues(forKeys: [.isExcludedFromBackupKey])
        return values?.isExcludedFromBackup ?? false
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
