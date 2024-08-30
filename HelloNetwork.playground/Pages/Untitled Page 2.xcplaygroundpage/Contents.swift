//: [Previous](@previous)

import Foundation

let data = """
{
    "date": "2016-10-25T00:00:00"
}
""".data(using: .utf8)!

struct Sample: Codable {
    let date: Date
}

do {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    
    let decoder = JSONDecoder() // double 값만 파싱이 가능하다.
    decoder.dateDecodingStrategy = .formatted(formatter)
    
    let result = try decoder.decode(Sample.self, from: data)
    print(result.date)
    
} catch {
    print(error)
}

// 2001.1.1 00:00:00 // Reference Date, Cocoa Timestamp
// 1970.1.1 00:00:00 // unix timestamp
