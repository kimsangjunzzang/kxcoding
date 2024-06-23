import UIKit

//Overriding, 재정의

class Figure {
    var name = "Unknown"
    
    init(name: String = "Unknown") {
        self.name = name
    }
    
    func draw() {
        print("draw \(name)")
    }
}


class Circle : Figure {
    var radius = 0.0
    
    // 읽기 전용 속성
    var diameter: Double {
        return radius * 2
    }
    
    override func draw() {
        super.draw() // 상위 클래스 호출
        print("draw 🍎")
    }
}

class Oval: Circle {
    override var radius: Double {
        get {
            return super.radius
        }
        set {
            super.radius = newValue
        }
    }
    
    override var diameter: Double {
        get {
            return super.diameter
        }
        set {
            super.radius = newValue / 2
        }
    }
}

let c = Circle(name: "Circle")
c.draw()

let o = Oval(name: "Oval")
o.radius
o.draw()


class MyViewController {
    init() {
        viewDidLoad()
        
    }
    
    func viewDidLoad() {
        print("Root view가 메모리에 로드되었습니다.")
    }
    
    func viewWillAppear() {
        print("Root view를 뷰 계층에 추가하기 전입니다.")
    }
    
    func viewIsAppear() {
        print("Root view를 뷰 계층에 추가하고 있습니다.")
    }
    
    func viewDidAppear() {
        print("Root view가 뷰 계층에 추가된 직후입니다.")
    }
    
    func addToViewHierarchy() {
        viewWillAppear()
        print("Root view를 뷰 계층에 추가합니다.")
        viewIsAppear()
        print("Root view가 뷰 계층에 추가되었습니다.")
        viewDidAppear()
    }
}

class LoginViewController: MyViewController {
    override func viewDidAppear() {
        super.viewDidAppear()
        
        print("키보드를 표시합니다.")
    }
}

let vc = LoginViewController()
vc.addToViewHierarchy()
