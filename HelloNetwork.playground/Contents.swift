import UIKit

let url = URL(string: "https://kxapi.azurewebsites.net/helloworld?apiKey=4TKFcdetA8Xw3NWVEgMd")!

url.scheme
// http, https(http + TLS), ftp, ftps, sftp, ssh
url.host(percentEncoded: true)

url.port // 논리적인 포트 0 ~ 65535, well-known port
url.host
url.path(percentEncoded: true) // 계층 구조로 반환
url.lastPathComponent
url.pathComponents

url.query(percentEncoded: true)
// ㅋㅣ = 값

let session = URLSession.shared // 싱글톤 객체

let task = session.dataTask(with: url) { data, response, error in
    if let error {
        // 경고창, 에러 화면으로 이동
        print(error)
        return
    }
    
    guard let httpResponse = response as? HTTPURLResponse else {
        return
    }
    
    guard httpResponse.statusCode == 200 else {
        return
    }
    
    guard let data else {
        return
    }
    
    let str = String(data: data, encoding: .utf8)
    print(str)
}

task.resume() // task 실행
              
              
