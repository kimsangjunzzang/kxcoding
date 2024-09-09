//
//  NetworkProvider.swift
//  TVMOVIE
//
//  Created by 김상준 on 9/9/24.
//

import Foundation

// 어떤 네트워크든지 생성할 수 있는 클래스

final class NetworkProvider {
    private let endpoint: String
    init(){
        self.endpoint = "https://api.themoviedb.org/3"
    }
    
    func makeTVNetwork() -> TVNetwork {
        let network = Network<TVListModel>(endpoint: endpoint)
        return TVNetwork(network: network)
    }
    
    func makeMovieNetwork() -> MovieNetwork {
        let network = Network<MovieListModel>(endpoint: endpoint)
        return MovieNetwork(network: network)
    }
}
