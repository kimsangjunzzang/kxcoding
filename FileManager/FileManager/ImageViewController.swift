//
//  ImageViewController.swift
//  FileManager
//
//  Created by 김상준 on 8/6/24.
//

import UIKit

class ImageViewController: UIViewController {
    
    var url: URL?

    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url, let data = try? Data(contentsOf: url) {
            imageView.image = UIImage(data: data)
            navigationItem.title = url.lastPathComponent
        }

        // Do any additional setup after loading the view.
    }
   
    @IBAction func share(_ sender: Any) {
        guard let dataToShare = imageView.image else { return }
        let activityViewController = UIActivityViewController(activityItems: [dataToShare], applicationActivities: nil)
        present(activityViewController,animated: true)
    }
    
    @IBAction func closeVC(_ sender: Any) {
        dismiss(animated: true)
    }
}
