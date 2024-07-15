//
//  DownloadOperation.swift
//  HelloOperation
//
//  Created by 김상준 on 7/16/24.
//

import Foundation
import UIKit

class DownloadOperation: Operation {
    let target: PhotoData
    
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
        do {
            let data = try Data(contentsOf: target.url)
            guard !isCancelled else {
                print(target.url,"Cancelled")
                return
            }
            if let image = UIImage(data: data) {
                let size = image.size.applying(CGAffineTransform(scaleX: 0.3, y: 0.3))
                
                UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
                let frame = CGRect(origin: .zero, size: size)
                image.draw(in: frame)
                let resultImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                
                guard !isCancelled else {
                    print(target.url, "Cancelled")
                    return
                }
                
                target.data = resultImage
            }
        } catch {
            print(target, error.localizedDescription)
        }
    }
    override func cancel() {
        super.cancel()
        
        print(target.url, "Cancel")
    }
}
