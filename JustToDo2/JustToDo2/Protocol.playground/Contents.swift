import UIKit


// ..able, ..ing
// AnyObject를 사용하면 클래스 전용 프로토콜이 된다.
protocol Walkable /* : AnyObject*/ {
    
    func walk()
}

protocol Runnable : Walkable {
    
    func run()
}

struct Person : Runnable {
    let name: String
    
    func walk() {
        print("두발로 걷습니다.")
    }
    func run() {
        print("두발로 뜁니다.")
    }
}

let tim = Person(name: "Tim Cook")
tim.name
tim.walk()

let steve: Walkable = Person(name: "Steve Jobs")
//steve.name
steve.walk()

let craig: Runnable = Person(name: "Craig Federighi") // 메모리에는 person이 올라가 있지만, Runnable 프로토콜이 채택 되어 있기때문에 접근은 불가능하다.
//craig.name
craig.run()
craig.walk()

// 원래 타입으로 캐스팅해서 속성에 저근
if let craig = craig as? Person {
    craig.name
}

// 이러한 방식으로 상속이 지원 되지 않는 구조체에서 상속돠 비슷한 효과를 만들어 낼 수 있다.

class Cat: Runnable {
    let name: String
    init(name: String) {
        self.name = name
    }
    func walk() {
        print("네발로 천천히 걷는다.")
    }
    func run() {
        print("네발로 빠르게 뛴다.")
    }
}

let lulu = Cat(name: "루루")

let list = [tim,steve,craig,lulu] // 가장 제한적인 Walkable 로 결정

for elem in list {
    elem.walk()
}

if let lulu = lulu as? Cat {
    lulu.name
}
