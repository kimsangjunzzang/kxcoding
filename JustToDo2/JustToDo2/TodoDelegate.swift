//
//  TodoDelegate.swift
//  JustToDo2
//
//  Created by 김상준 on 6/21/24.
//

import UIKit

// Swift Protocol : 스위프트 프로토콜은 모든 맴버들이 필수 맴버들이다. 따라서 선택적 맴버들을 추가하려면 오브젝티브 씨 프로토콜로 바꿔야한다.
// protocol TodoDelegate : AnyObject{
//    func addViewController(_ vc: UIViewController, didInsert todo: String)
//    func addViewControllerDidCancel(_ vc: UIViewController)
//}

@objc protocol TodoDelegate : AnyObject{
    func addViewController(_ vc: UIViewController, didInsert todo: String)
    @objc optional func addViewControllerDidCancel(_ vc: UIViewController) // 선택적 메서드가 됨
}
