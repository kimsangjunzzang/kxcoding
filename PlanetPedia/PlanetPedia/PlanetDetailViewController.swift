//
//  PlanetDetailViewController.swift
//  PlanetPedia
//
//  Created by 김상준 on 7/10/24.
//

import UIKit

class PlanetDetailViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var planet: Planet?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let planet {
            let img = UIImage(named: planet.englishName.lowercased())
            backgroundImageView.image = img
        }

    }
    
}
