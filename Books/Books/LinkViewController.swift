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

/* 로그인 api 강의
 func sendLoginRequest(id: String, password: String){
         guard let url = URL(...) else { return }
         
         let body = LoginPostBody(id: id, password: password)
         
         var request = URLRequest(url: url)
         request.httpMethod = "POST"
         request.httpBody = try? JSONEncoder().encode(body)
         
         let session = URLSession.shared
         
         let task = session.dataTask(with: request) { data, response, error in
             
         
         }
         task.resume()
 }
 */
