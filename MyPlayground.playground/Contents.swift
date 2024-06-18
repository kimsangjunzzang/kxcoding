import UIKit


// MARK: class & struct

/*
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

Person(name: "Name", age: 0)

struct Person{
    var name: String
    var age: Int
}
Person(name: "Name",age: 0)
*/

//MARK: Enumeration

/*
enum Alignment {
    case left
    case center
    case right
}
Alignment.center
*/

//MARK: Rawvalue, 원시값은 변경이 불가능하다.

/*
 enum Alignment: Int{
    case left
    case right
    case center
}

Alignment.left.rawValue // 0
Alignment.right.rawValue // 1
Alignment.center.rawValue // 2

Alignment(rawValue: 0) // .left
Alignment(rawValue: 200) // nil

*/

/*
enum Weekday : String {
    case sunday
    case monday = "MON"
    case tuesday
    case wendnesday
    case thursday
    case firday
    case saturday
}

Weekday.sunday.rawValue // sunday
Weekday.monday.rawValue // MON
Weekday.tuesday.rawValue // tuesday
*/
