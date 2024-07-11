import UIKit

// required initializers
class Person {
    let name: String
    
    required init(name: String) {
        self.name = name
    }
}

class Member: Person {
    var point = 0;
    
    init() {
        point = 0
        super.init(name: "unknown")
    }
    
    required init(name: String) {
        point = 0
        super.init(name: name)
    }
}

// Failable Initializer

// init?
// init!

struct Position {
    let x: Double
    let y: Double
    
    init?(x: Double, y: Double) {
        guard x >= 0.0, y >= 0.0 else {
            return nil
        }
        
        self.x = x
        self.y = y
    }
    
    init!(value: Double) { // IUO
        guard value >= 0.0 else {
            return nil
        }
        
        self.x = value
        self.y = value
    }
    
    init(value: Int) {
//        self.x = value
//        self.y = value
        self.init(value: Double(value))
    }
    
}

var a = Position(x: 12, y: 23)
a?.x
a?.y

a = Position(x: -2, y: -3)
a?.x
a?.y

var b: Position = Position(value: 12)
b.x
b.y

b = Position(value: -12)
b.x

