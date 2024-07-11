import UIKit

protocol Filter {
    func apply(to image: UIImage) -> UIImage
}

class NoirFilter : Filter {
    func apply(to image: UIImage) -> UIImage {
        print("느와르 필터 적용중...")
        return image
    }
}

class SkyFilter : Filter{
    func apply(to image: UIImage) -> UIImage {
        print("스카이 필터 적용중...")
        return image
    }
}

class OceanFilter : Filter{
    func apply(to image: UIImage) -> UIImage {
        print("오션 필터 적용중...")
        return image
    }
}

class PhotoExporter {
    var filter: NoirFilter?
    
    func export(image: UIImage) {
        guard let filter else {
            fatalError("필터가 필요합니다.")
        }
        filter.apply(to: image)
        print("사진을 익스포트 합니다.")
    }
}

let img = UIImage(systemName: "star")!
let exporter = PhotoExporter()
exporter.filter = NoirFilter() // 속성 주입, 프로퍼티 인젝션
exporter.export(image: img)

class PhotoExporterIDI {
    private let filter: NoirFilter
    
    init(filter: NoirFilter) { // 이니셜라이징 인젝션
        self.filter = filter
    }
    
    func export(image: UIImage) {
        filter.apply(to: image)
        print("사진을 익스포트 합니다.")
    }
}

let exporter2 = PhotoExporterIDI(filter: NoirFilter())
exporter2.export(image: img)

/*
 
 은닉성: Encapsulation, Information Hiding
 
 의존 관계 역전 법칙 DIP
 1. 고수준의 모듈은 저수준의 모듈에 의존하지 않고 추상화에 의존해야한다.
 2. 추상화는 세부 구현에 의존하면 안된다. 세부 구현이 추상화에 의존해야한다.
 
 추상화
 
*/

class PhotoExporterII {
    var filter: Filter
    
    init(filter: Filter) { // 인터페이스 인젝션
        self.filter = filter
    }
    
    func export(image: UIImage) {
        filter.apply(to: image)
        print("사진을 익스포트 합니다.")
    }
}

let exporter3 = PhotoExporterII(filter: NoirFilter())
exporter3.filter = SkyFilter()
exporter3.export(image: img)
