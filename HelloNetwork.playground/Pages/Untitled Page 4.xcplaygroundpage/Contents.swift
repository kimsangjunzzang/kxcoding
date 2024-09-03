import Foundation

struct Books : Codable {
    
    struct BookSummary: Codable {
        let id : Int
        let title: String
        
    }
    let list: [BookSummary]
    let code : Int
    let message : String?
    
}

var url = URL(string:"https://kxapi.azurewebsites.net/books")!
url.append(queryItems: [
    URLQueryItem(name: "apiKey", value: "4TKFcdetA8Xw3NWVEgMd")
])

let session = URLSession.shared

var request = URLRequest(url: url)
request.addValue("2.0", forHTTPHeaderField: "kxcoding-api-version")

let task = session.dataTask(with: request) { data, response, error in
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
        
        let books = try decoder.decode(Books.self, from: data)
       
        
    } catch {
        print(error)
    }
}
task.resume()

