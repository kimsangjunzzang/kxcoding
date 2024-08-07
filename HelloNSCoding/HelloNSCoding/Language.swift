//
//  language.swift
//  HelloNSCoding
//
//  Created by 김상준 on 8/7/24.
//

import Foundation
import UIKit

class Language: NSObject,NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(version, forKey: "version")
        coder.encode(logo, forKey: "logo")
    }
    
    required init?(coder: NSCoder) {
        guard let nameValue = coder.decodeObject(forKey: "name") as? String else { return nil }
        name = nameValue
        
        version = coder.decodeDouble(forKey: "version")
        
        guard let img = coder.decodeObject(forKey: "logo") as? UIImage else { return nil }
        logo = img
    }
    
    let name: String
    let version: Double
    let logo: UIImage
    
    init(name: String, version: Double, logo: UIImage) {
        self.name = name
        self.version = version
        self.logo = logo
    }
}
