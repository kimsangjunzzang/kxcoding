import UIKit

let url = URL(string: "https://kxapi.azurewebsites.net/helloworld?apiKey=4TKFcdetA8Xw3NWVEgMd")!

url.scheme
// http, https(http + TLS)

// ftp
// ftps
// sftp

// ssh

url.host(percentEncoded: true)

url.port // 논리적인 포트 0 ~ 65535, well-known port
url.host
url.path(percentEncoded: true) // 계층 구조로 반환
url.lastPathComponent
url.pathComponents

url.query(percentEncoded: true)
// ㅋㅣ = 값

              
              
