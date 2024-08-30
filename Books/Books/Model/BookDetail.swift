//
//  BookDetail.swift
//  Books
//
//  Created by 김상준 on 8/30/24.
//

import Foundation

struct BookDetail : Codable {
    
    struct Book: Codable {
        let id : Int
        let title: String
        let summary: String
        let storeLink: URL
        let publicationDate : Date
    }
    let data: Book
    let code : Int
    let message : String?
    
}
