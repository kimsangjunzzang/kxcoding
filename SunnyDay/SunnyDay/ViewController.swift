//
//  ViewController.swift
//  SunnyDay
//
//  Created by 김상준 on 6/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var temperatureLable: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let weather = "비"
        let temperature = -10
        
        statusLabel.text = weather
        temperatureLable.text = String(temperature)
        
        switch temperature {
        case ..<(-10):
            descriptionLabel.text = "이불 밖은 위험해요"
        case -10...10:
            descriptionLabel.text = "두툼한 패딩을 챙기세요"
        case 11 ... 20:
            descriptionLabel.text = "일교차를 조심하세요"
        case 21 ... 30:
            descriptionLabel.text = "여름이 다가오고 있어요"
        case 31...:
            descriptionLabel.text = "XX 여름"
        default:
            break
        }
//        
//        if temperature < -10 {
//            descriptionLabel.text = "이불 밖은 위험해요"
//        }else if temperature >= -10 && temperature <= 10{
//            descriptionLabel.text = "두툼한 패딩을 챙기세요"
//        }else if temperature >= 11 && temperature <= 20{
//            descriptionLabel.text = "일교차를 조심하세요"
//        }else if temperature >= 21 && temperature <= 30{
//            descriptionLabel.text = "여름이 다가오고 있어요"
//        }else{
//            descriptionLabel.text = "xx 여름"
//            
//        }
        
        switch weather {

        case "맑음" :
            weatherImageView.image = UIImage(named: "016-sun")
        case "흐림" :
            weatherImageView.image = UIImage(named: "001-cloud")
        case "눈" :
            weatherImageView.image = UIImage(named: "004-cloud")
        case "비" :
            weatherImageView.image = UIImage(named: "002-cloud")
        default:
            break
        }
        
    }
    
    
}

