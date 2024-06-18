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
        
        let weather = [Weather.clear,Weather.cloudy,Weather.rain,Weather.snow].randomElement() ?? Weather.clear
        let temperature = Int.random(in: -20 ... 38)
        
        weatherImageView.image = weather.image
        statusLabel.text = weather.rawValue
        temperatureLable.text = String(temperature)
        descriptionLabel.text = weather.getDescription(matching: temperature)
    }
}

