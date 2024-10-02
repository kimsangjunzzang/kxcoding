//
//  Network.swift
//  TVMOVIE
//
//  Created by 김상준 on 9/9/24.
//

import Foundation
import RxSwift
import RxAlamofire

class Network<T:Decodable> {
    private let endpoint: String
    private let queue : ConcurrentDispatchQueueScheduler
    
    init(endpoint: String) {
        self.endpoint = endpoint
        self.queue = ConcurrentDispatchQueueScheduler(qos: .background)
    }
    
    // 네트워크를 사용하면서 옵져버블을 리턴받는다.
    func getItemList(path: String) -> Observable<T>{
        let fullPath = "\(endpoint)\(path)?api_key=\(apiKey)&language=ko"
        return RxAlamofire.data(.get, fullPath)
        // 후속 처리
            .observeOn(queue) // 백그라운드에서 작업을 실행 할 것으로 명령
            .debug()
            .map { data -> T in
                return try JSONDecoder().decode(T.self, from: data)
            }
        
    }
}
