import UIKit

var greeting = "Hello, playground"
greeting.count.description
// 체이닝. Chaing
// 이렇게 .을 찍고 멤버에 접근하는 것을 체이닝이라고 한다.


var optionalGreetding: String? = "Hello, playground"

let a = optionalGreetding?.count.description
let b = optionalGreetding!.count.description // nil 일 경우 crash 발생 -> 그냥 사용하지마라
// 옵셔널 체이닝. Optional Chaining

