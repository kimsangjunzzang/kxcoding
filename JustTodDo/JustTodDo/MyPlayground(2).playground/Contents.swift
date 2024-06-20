import UIKit

// 범용 타입
var a : Any = 123
a = 456
a = 456.789
a = "Hello"
// a.count


a is Int
// a에 저장된 값이 Int 인지 확인 하는 코드
// type check operator
// is 연산자
// Value or expr is type

a is String

let str = "Hello" // Swift String, 구조체

let nsstr: NSString = "Hello"

// NSString, 클래스, Foundation String
// toll-free bridged type -> 서로 호환되는 타입
// Array, NSArray
// Date, NSDate

let nsstrFrom: NSString = str as NSString
//let strFromNSstr: String = nsstr as String

// as 연산자. type casting operator
// val or expr as Type

// Forced Cast
//let strFromNSstr: String = a as! String

// Conditional Cast
let strFromNSstr: String? = a as? String

if let a = a as? String {
    a.count
}
