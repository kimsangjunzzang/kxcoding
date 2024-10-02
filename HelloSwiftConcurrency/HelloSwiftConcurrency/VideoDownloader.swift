//
//  VideoDownloader.swift
//  HelloSwiftConcurrency
//
//  Created by 김상준 on 10/3/24.
//

import Foundation

class VideoDownloader {
    let url = URL(string: "https://dl.dropboxusercontent.com/scl/fi/005l78b70njw8bqn7cz3h/video.mp4?rlkey=zyaiyuiq790h8dw9lz76yk4qn&st=1w36qmea&dl=0")!
    
    let localUrl = URL(filePath: NSTemporaryDirectory().appending("video.mp4"))
    
    func download() throws -> URL  {
        let data = try Data(contentsOf: url)
        
        try data.write(to: localUrl, options: .atomic)
        
        return localUrl
    }
}

enum DounloadError: Error {
    case error
}
