//
//  ViewController.swift
//  HelloNSCoding
//
//  Created by 김상준 on 8/7/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var versionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let fileUrl: URL = {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("swift").appendingPathExtension("data")
        
    }()

    @IBAction func encodeObject(_ sender: Any) {
        do {
            guard let img = UIImage(named: "swift") else { return }
            
            let obj = Language(name: "Swift", version: 5.9, logo: img)
            
            let data = try NSKeyedArchiver.archivedData(withRootObject: obj, requiringSecureCoding: false)
            
            try data.write(to: fileUrl,options: .atomic)
            
            print("Done")
        } catch {
            print(error)
        }
    }
    
    @IBAction func decodeObject(_ sender: Any) {
        do {
            let data = try Data(contentsOf: fileUrl)
            
            if let language = NSKeyedUnarchiver.unarchiveObject(with: data) as? Language {
                logoImageView.image = language.logo
                nameLabel.text = language.name
                versionLabel.text = "\(language.version)"
            }
            
        } catch {
            print(error)
        }
    }
}

