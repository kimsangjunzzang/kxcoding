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
            guard let img = UIImage(named: "swift")?.pngData() else { return }
            
            let obj = Language(name: "Swift", version: 5.9, logo: img)
            
            let archiver = NSKeyedArchiver(requiringSecureCoding: true)
            try archiver.encodeEncodable(obj, forKey: NSKeyedArchiveRootObjectKey)
            try archiver.encodedData.write(to: fileUrl, options: .atomic)
            
            archiver.finishEncoding()
            
//            let data = try NSKeyedArchiver.archivedData(withRootObject: obj, requiringSecureCoding: true)
//            
//            try data.write(to: fileUrl,options: .atomic)
            
            print("Done")
        } catch {
            print(error)
        }
    }
    
    @IBAction func decodeObject(_ sender: Any) {
        do {
            let data = try Data(contentsOf: fileUrl)
            
            let unarchiver = try NSKeyedUnarchiver(forReadingFrom: data)
            unarchiver.requiresSecureCoding = true
            
            if let language = unarchiver.decodeDecodable(Language.self, forKey: NSKeyedArchiveRootObjectKey) {
                logoImageView.image = UIImage(data: language.logo)
                nameLabel.text = language.name
                versionLabel.text = "\(language.version)"
                
                unarchiver.finishDecoding()
            }
            
        } catch {
            print(error)
        }
    }
}

