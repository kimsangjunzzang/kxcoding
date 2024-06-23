import UIKit

// [Int?] // 인트가 아닐 수 도 있다. var arr: [Int?] = [1, 2, 3, nil]
// [Int]? // 배열이 없을 수 도 있다.


var arr: [Int] = [1, 2, 3]
// 똑같은 타입의 값. 두 개 이상 저장
// 순서
// 값 = 엘리먼트, 요소
arr.first
arr.last

arr[0]
arr[1] // 서브스크립트 문법
//arr[100] 범위를 벗어나기 때문에 바로 크래시

arr.append(4)
arr.insert(0, at: 0)
arr[0] = 100

arr.remove(at: 0)
arr.removeFirst()
arr.removeLast()
arr.removeAll()



// 키(a.k.a 단어) & 값(a.k.a 뜻) = 엘리먼트
var dict: [String: String] = ["Apple": "사과", "Banana": "바나나"]
print(dict)

dict.first // 딕셔너리에서는 fisrt 쓰지 마라
dict["Apple"] // 키를 통해서 값에 접근한다.
dict["Orange"] // nil 반환
dict["Melon", default: "기본멜로"] // 기본값을 전달 가능하다.

dict.updateValue("오렌지", forKey: "Orange")
print(dict)

dict.updateValue("어륀지", forKey: "Orange")
print(dict)

// Upsert = Update + Insert

dict["Strawberry"] = "딸기"
print(dict)

dict.removeValue(forKey: "Strawberry")
dict.removeValue(forKey: "Strawberry")
dict.removeAll()

dict["Apple"] = nil // 삭제
dict.removeAll()
