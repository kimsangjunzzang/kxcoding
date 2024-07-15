//
//  FilterOperation.swift
//  HelloOperation
//
//  Created by 김상준 on 7/16/24.
//

import Foundation
import UIKit

class FilterOperation: Operation {
    let target: PhotoData
    let context = CIContext(options: nil)
    
    init(target: PhotoData) {
        
        self.target = target
        super.init()
    }
    
    override func main() {
        print(target.url,"Start")
        
        defer {
            if isCancelled {
                print(target.url,"Cancelled")
            } else {
                print(target.url, "Done")
            }
        }
        guard !Thread.isMainThread else {
            fatalError()
        }
        
        guard !isCancelled else {
            print(target.url, "Cancelled")
            return
        }
        
        guard let source = target.data?.cgImage else {
            fatalError()
        }
        let ciImage = CIImage(cgImage: source)
        
        guard !isCancelled else {
            print(target.url,"Cancelled")
            return
        }
        
        let filter = CIFilter(name: "CIPhotoEffectNoir")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        
        guard !isCancelled else {
            print(target.url,"Cancelled")
            return
        }
        
        guard let ciResult = filter?.value(forKey: kCIOutputImageKey) as? CIImage else {
            fatalError()
        }
        
        guard !isCancelled else {
            print(target.url,"Cancelled")
            return
        }
        
        guard let cgImage = context.createCGImage(ciResult, from: ciResult.extent) else {
            fatalError()
        }
        target.data = UIImage(cgImage: cgImage)
        
        
    }
    override func cancel() {
        super.cancel()
        print(target.url,"Cancel")
    }
    
}
