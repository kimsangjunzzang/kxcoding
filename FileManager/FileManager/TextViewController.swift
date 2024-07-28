//
//  TextViewController.swift
//  FileManager
//
//  Created by 김상준 on 7/29/24.
//

import UIKit

class TextViewController: UIViewController {
    var url : URL?

    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url {
            contentTextView.text = try? String(contentsOf: url)
            navigationItem.title = url.lastPathComponent
        }
    }
    
    @IBAction func closeVC(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func share(_ sender: Any) {
        let dataToShare = contentTextView.text
        let activityViewController = UIActivityViewController(activityItems: [dataToShare], applicationActivities: nil)
        present(activityViewController,animated: true)
    }

}
