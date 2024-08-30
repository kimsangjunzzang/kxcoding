//
//  LinkViewController.swift
//  Books
//
//  Created by 김상준 on 8/30/24.
//

import UIKit
import WebKit

class LinkViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
