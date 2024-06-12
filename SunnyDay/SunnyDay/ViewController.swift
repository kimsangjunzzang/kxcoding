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
        let temperature = 10
        
        weatherImageView.image = getWeatherImage(matching: weather)
        statusLabel.text = weather
        temperatureLable.text = String(temperature)
        descriptionLabel.text = getTemperatureDescription(matching: temperature)
        
        
    }
    
    func getWeatherImage(matching weather: String) -> UIImage? {
        switch weather {
        case "맑음" :
            return  UIImage(named: "016-sun")
        case "흐림" :
            return UIImage(named: "001-cloud")
        case "눈" :
            return UIImage(named: "004-cloud")
        case "비" :
            return UIImage(named: "002-cloud")
        default:
            return nil
        }
        
    }
    
    func getTemperatureDescription(matching temperature: Int) -> String{
        switch temperature {
        case ..<(-10):
            return "이불 밖은 위험해요"
        case -10...10:
            return "두툼한 패딩을 챙기세요"
        case 11 ... 20:
            return "일교차를 조심하세요"
        case 21 ... 30:
            return "여름이 다가오고 있어요"
        case 31...:
            return "XX 여름"
        default:
            return ""
        }
    }
}

