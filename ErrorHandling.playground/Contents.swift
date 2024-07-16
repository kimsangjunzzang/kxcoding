import UIKit

// Compile Error
// Runtime Error

enum DataParsingError: Error {
    case invalidType
    case invalidField
    case missingRequiredField(String)
    
}

func parsing(data: [String: Any]) throws {
    guard let _ = data["name"] else {
        throw DataParsingError.missingRequiredField("name")
    }
    guard let _ = data["age"] as? Int else {
        throw DataParsingError.invalidType
    }
    //Parsing
}

try? parsing(data: [:])



func test() throws {
    do {
        try parsing(data: ["name": ""])
    } catch DataParsingError.invalidType {
        print("handle invalidType Error")
    } catch {
        print("handle error")
        if let error = error as? DataParsingError {
            switch error {
            case .invalidType:
                print("invalid Type")
            default:
                print("handle error")
                
            }
        }
    }
}
//try test()
if let _ = try? parsing(data: [:]) {
    print("success")
} else {
    print("fail")
}

try? parsing(data: [:])
//try! parsing(data: [:])
