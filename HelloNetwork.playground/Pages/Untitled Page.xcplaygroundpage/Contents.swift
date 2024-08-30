import UIKit

struct Books : Codable {
    
    struct Book : Codable{
        let id: Int
        let title: String
        let summary: String
        let storeLink: URL
        let publicationDate: Date
    }
    
    let totalCount: Int
    let list: [Book]
    let code: Int
    let message: String?
}

let url = URL(string: "https://kxapi.azurewebsites.net/books?apiKey=4TKFcdetA8Xw3NWVEgMd")!

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
    
    do {
        let decoder = JSONDecoder()
        let books = try decoder.decode(Books.self, from: data)
        
//        if let link = books.list.first?.storeLink, let url = URL(string: link){
//            print(url)
//        }
        
    } catch {
        print(error)
    }
}

task.resume() // task 실행
              
              
