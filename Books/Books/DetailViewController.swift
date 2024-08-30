//
//  DetailViewController.swift
//  Books
//
//  Created by 김상준 on 8/30/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var contentTextView: UITextView!
    
    var id: Int?
    
    func fetchDetail() {
        guard let id else { return }
        var url = URL(string:"https://kxapi.azurewebsites.net/books/\(id)")!
        url.append(queryItems: [
            URLQueryItem(name: "apiKey", value: "4TKFcdetA8Xw3NWVEgMd")
        ])

        let session = URLSession.shared

        let task = session.dataTask(with: url) { data, response, error in
            if let error {
                print(error)
                return
            }
            
            guard let httpsResponse = response as? HTTPURLResponse, httpsResponse.statusCode == 200 else {
                return
            }
            
            guard let data else {
                return
            }
            
            do {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                
                let decoder = JSONDecoder() // double 값만 파싱이 가능하다.
                decoder.dateDecodingStrategy = .formatted(formatter)
                
                let bookDetail = try decoder.decode(BookDetail.self, from: data)
               
                let content = "\(bookDetail.data.summary)\n\n\(bookDetail.data.publicationDate.formatted())"
                
                DispatchQueue.main.async{
                    self.contentTextView.text = content
                }
            } catch {
                print(error)
            }
        }
        task.resume()

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchDetail()
    }
}
