//
//  Books.swift
//  Books
//
//  Created by 김상준 on 8/30/24.
//

import Foundation


struct Books : Codable {
    
    struct BookSummary: Codable {
        let id : Int
        let title: String
        
    }
    let list: [BookSummary]
    let code : Int
    let message : String?
    
}


