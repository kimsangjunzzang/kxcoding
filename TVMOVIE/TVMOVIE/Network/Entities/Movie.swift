//
//  Movie.swift
//  TVMOVIE
//
//  Created by 김상준 on 9/9/24.
//


import Foundation


struct MovieListModel : Decodable {
    let page : Int
    let results : [Movie]
}

struct Movie : Decodable {
    let title: String
    let overview: String
    let posterURL: String
    let vote: String
    let releaseDate: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case overview
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case releaseDate = "release_date"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        overview = try container.decode(String.self, forKey: .overview)
        
        let path = try container.decode(String.self, forKey: .posterPath)
        posterURL = "http://image.tmdb.org/t/p/w500\(path)"
        
        let voteAverage = try container.decode(Float.self, forKey: .voteAverage)
        let voteCount = try container.decode(Int.self, forKey: .voteCount)
        vote = "\(voteAverage) (\(voteCount))"
        
        releaseDate = try container.decode(String.self, forKey: .releaseDate)
    }
    
}
