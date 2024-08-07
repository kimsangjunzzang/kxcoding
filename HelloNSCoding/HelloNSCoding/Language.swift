//
//  language.swift
//  HelloNSCoding
//
//  Created by 김상준 on 8/7/24.
//

import Foundation
import UIKit

struct Language: Codable {
    let name: String
    let version : Double
    let logo: Data
}


//class Language: NSObject,NSCoding, NSSecureCoding {
//    static var supportsSecureCoding: Bool {
//        return true
//    }
//    
//    func encode(with coder: NSCoder) {
//        coder.encode(name as NSString, forKey: "name") // 박싱, Boxing
//        coder.encode(version as NSNumber, forKey: "version")
//        coder.encode(logo, forKey: "logo")
//    }
//    
//    required init?(coder: NSCoder) {
//        guard let nameValue = coder.decodeObject(of: NSString.self, forKey: "name") as? String else { return nil }
//        name = nameValue
//        
//        guard let versionValue = coder.decodeObject(of: NSNumber.self, forKey: "version") else { return nil }
//        version = versionValue.doubleValue // Unboxing
//        
//        guard let img = coder.decodeObject(of: UIImage.self,forKey: "logo")  else { return nil }
//        logo = img
//    }
//    
//    let name: String
//    let version: Double
//    let logo: UIImage
//    
//    init(name: String, version: Double, logo: UIImage) {
//        self.name = name
//        self.version = version
//        self.logo = logo
//    }
//}
