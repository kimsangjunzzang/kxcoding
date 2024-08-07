//
//  ViewController.swift
//  HelloPropertyList
//
//  Created by 김상준 on 8/7/24.
//

import UIKit

struct Development: Codable {
    let language: String
    let os: String
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var osLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loadFromBundle(_ sender: Any) {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "plist") else { fatalError() }
        
        guard let arr = try? NSArray(contentsOf: url, error: ()) as? [String] else { fatalError() }
        
        languageLabel.text = arr.first
        osLabel.text = arr.last
    }
    
    let fileUrl: URL = {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("data").appendingPathExtension("plist")
    }()
    
    @IBAction func loadFromDocuments(_ sender: Any) {
        do {
            let data = try Data(contentsOf: fileUrl)
            let decoder = PropertyListDecoder()
            let dev = try decoder.decode(Development.self, from: data)
            print(dev)
            
            languageLabel.text = dev.language
            osLabel.text = dev.os
        } catch {
            print(error)
        }
        
        
    }
    @IBAction func saveToDocuments(_ sender: Any) {
        do {
            let dev = Development(language: "Swift", os: "macOS")
            
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(dev)
            try data.write(to: fileUrl)
            print("Done")
        } catch {
            print(error)
        }
        
    }
}

