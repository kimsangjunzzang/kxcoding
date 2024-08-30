//: [Previous](@previous)

import Foundation

struct BookDetail : Codable {
    
    struct Book: Codable {
        let id : Int
        let title: String
        let summary: String
        let storeLink: URL
        let publicationDate : Date
    }
    let data: Book
    let code : Int
    let message : String?
    
}

var url = URL(string:"https://kxapi.azurewebsites.net/books/1")!
url.append(queryItems: [
    URLQueryItem(name: "apiKey", value: "4TKFcdetA8Xw3NWVEgMd")
])

let session = URLSession.shared

let task = session.dataTask(with: url) { data, response, error in
    if let error {
        print(error)
        return
    }
    
    guard let httpsResponse = response as? HTTPURLResponse, httpsResponse.statusCode == 200 else {
        return
    }
    
    guard let data else {
        return
    }
    
    do {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        let decoder = JSONDecoder() // double 값만 파싱이 가능하다.
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        let bookDetail = try decoder.decode(BookDetail.self, from: data)
        dump(bookDetail)
        
    } catch {
        print(error)
    }
}
task.resume()

