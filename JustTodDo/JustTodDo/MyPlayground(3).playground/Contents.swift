import UIKit

var greeting = "Hello, playground"

// 옵셔널 체이닝과 타입 캐스팅은 모든 타입에서 사용하지만, 업 캐스팅과 다운 캐스팅은 하나의 상속 계층과 관계가 있다.
// 상속은 클래스에서만 가능하기 때문에 구조체나 열거형에서는 사용이 불가능하다.

class A {
    let one = "one"
}

class B: A {
    let two = "two"
}
class C: B {
    let three = "three"
}

let a = A()
a.one
//a.two
//a.three

let b : A = B() // 업캐스팅 -> 이렇게 되면 A 타입에는 two가 없기 때문에 실제 B의 메모리에는 있지만 사용 불가는 하게 된다.
b.one
//b.two
//b.three

let c = C()

c.one
c.two
c.three


let valueList = [1,2,"3"] as [Any]

// valueList[2].count
//-> 사용 불가

// 이런식으로 만들어 줘야 사용이 가능하다.
if let str = valueList[2] as? String {
    str.count
}
