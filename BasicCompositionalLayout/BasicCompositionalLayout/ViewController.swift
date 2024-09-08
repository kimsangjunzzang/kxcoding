//
//  ViewController.swift
//  BasicCompositionalLayout
//
//  Created by 김상준 on 9/8/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

// 컬렉션 뷰 섹션으로 들어가기 위해서는 Hashable이라는 프로토콜로 채택해줘야 한다.

// 섹션과 아이템 정의

// 섹션
struct Section: Hashable {
    let id: String
}

// 해당 섹션에 들어갈 아이템
// 아이템은 3가지가 있고 해당 아이템에 들어가는 모델은 HomeItem이다.
enum Item: Hashable {
    case banner(HomeItem)
    case normalCarousel(HomeItem)
    case listCarousel(HomeItem)
}


struct HomeItem: Hashable {
    let title: String
    let subTitle: String?
    let imageUrl: String
}
// 추가적으로 해야할 일
// 컬렉션 뷰 cell UI - 등록
// 레이아웃 구현 - 3가지
// datasource -> cellProvider
// snapshot -> datasource.apply(snapshot)
