//: [Previous](@previous)

import Foundation

func processFile(path: String) {
    print(1)
    let file = FileHandle(forReadingAtPath: path)
    
    //do something
    defer {
        print(2)
        file?.closeFile()
    }
    
    if path.hasSuffix(".jpg") {
        print(3)
        return
    }
    
    
    print(4)
}

//processFile(path: "file.jpg")
func testDefer() {
    defer {
        print(1)
    }
    defer {
        print(2)
    }
    defer {
        print(3)
    }
}

testDefer()
