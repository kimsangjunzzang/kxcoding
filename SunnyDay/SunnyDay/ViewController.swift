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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let weather = "비"
        let temperature = 17
        
        if weather == "맑음"{
            weatherImageView.image = UIImage(named: "016-sun")
        }else if weather == "흐림"{
            weatherImageView.image = UIImage(named: "001-cloud")
        }else if weather == "눈"{
            weatherImageView.image = UIImage(named: "004-cloud")
        }else if weather == "비"{
            weatherImageView.image = UIImage(named: "002-cloud")
        }
        
        statusLabel.text = weather
        temperatureLable.text = String(temperature)
    }


}

