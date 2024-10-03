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
    
    // 메인 쓰레드에서 다운로드
    func download() throws -> URL  {
        let data = try Data(contentsOf: url)
        
        try data.write(to: localUrl, options: .atomic)
        
        return localUrl
    }
    
    // 백그라운드에서 비동기로 다운로드
    // 문제점
    // 1. 에러를 직접 보내지 못하니깐 Result 타입에 담아서 보내야한다.
    // 2. 값을 바로 리턴하는 것도 불가능 하다.
    // 3. completion을 호출하는 코드를 빼먹어도 컴파일러가 인식하지 못한다 (가장 큰 문제점이다.)
    func download(completion: @escaping (Result<URL, Error>) -> ()) {
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: self.url)
                try data.write(to: self.localUrl, options: .atomic)
                
                DispatchQueue.main.async {
                    completion(.success(self.localUrl))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    // 동기 메서드 처럼 보이나 비동기로 작동 되고 있는 코드이다.
    func download() async throws -> URL { // async method
        let (data,response) = try await URLSession.shared.data(from: url)
        // await = suspension point, 일시중단 지점
        
        guard let httpUrlResponse = response as? HTTPURLResponse, httpUrlResponse.statusCode == 200 else {
            throw DounloadError.error
        }
        try data.write(to: localUrl, options: .atomic)
        return localUrl
    }
}

enum DounloadError: Error {
    case error
}
