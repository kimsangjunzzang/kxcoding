//
//  ViewController.swift
//  Books
//
//  Created by 김상준 on 8/30/24.
//

import UIKit

class ViewController: UIViewController{
    
    var books = [Books.BookSummary]()
    
    @IBOutlet weak var booksTableView: UITableView!
    
    func fetchBooks() {
        var url = URL(string:"https://kxapi.azurewebsites.net/books")!
        url.append(queryItems: [
            URLQueryItem(name: "apiKey", value: "4TKFcdetA8Xw3NWVEgMd")
        ])
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        request.addValue("2.0", forHTTPHeaderField: "kxcoding-api-version")
        
        let task = session.dataTask(with: request) { data, response, error in
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
            print(String(data: data, encoding: .utf8)!)
            
            do {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                
                let decoder = JSONDecoder() // double 값만 파싱이 가능하다.
                decoder.dateDecodingStrategy = .formatted(formatter)
                
                let books = try decoder.decode(Books.self, from: data)
                self.books = books.list
                
                DispatchQueue.main.async {
                    self.booksTableView.reloadData()
                }
                
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let indexPath = booksTableView.indexPath(for: cell) {
            if let vc = segue.destination as? DetailViewController {
                vc.id = books[indexPath.row].id
                vc.navigationItem.title = books[indexPath.row].title
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchBooks()
    }
}
extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int
    ) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let tartget = books[indexPath.row]
        cell.textLabel?.text = tartget.title
        return cell
    }
    
}
