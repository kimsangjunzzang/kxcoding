//
//  ViewModel.swift
//  TVMOVIE
//
//  Created by 김상준 on 9/11/24.
//

import Foundation
import RxSwift

class ViewModel {
    let disposeBag = DisposeBag()
    private let tvNetwork: TVNetwork
    private let movieNetwork: MovieNetwork
    
    init() {
        let provieder = NetworkProvider()
        tvNetwork = provieder.makeTVNetwork()
        movieNetwork = provieder.makeMovieNetwork()
    }
    
    struct Input {
        let tvTrigger : Observable<Void>
        let movieTrigger : Observable<Void>
    }
    
    struct Output {
        let tvList: Observable<[TV]>
        let movieResult: Observable<MovieResult>
    }
    
    func transform(input: Input) -> Output {
        
        //triger -> 네트워크 -> Observable<T> -> VC 전달 -> VC에서 구독
        
        // tvTrigger -> Observable<Void> -> Observable<[TV]>
//        input.tvTrigger.bind {
//            print("TV Trigger")
//        }.disposed(by: disposeBag)
        
        let tvList = input.tvTrigger.flatMapLatest({ [unowned self] _ -> Observable<[TV]>in
            //Observable<TVListModel> -> Observable<[TV]>
            return self.tvNetwork.getTopRatedList().map { $0.results }
        })
        
//        input.movieTrigger.bind {
//            print("MOVIE Trigger")
//        }.disposed(by: disposeBag)
        let movieResult = input.movieTrigger.flatMapLatest { [unowned self] _ -> Observable<MovieResult> in
            // combineLatest
            //Observable 1 , 2 ,3 합쳐서 하나의 Observable로 바꾸고 싶다면?
            
           return Observable.combineLatest( self.movieNetwork.getUpcomingList(), self.movieNetwork.getPopularList(), self.movieNetwork.getNowPlayingList())
            { upcoming, popular, nowPlaying -> MovieResult in
                return MovieResult(upcoming: upcoming, popular: popular, nowPlaying: nowPlaying)
                
            }
        }
        
        return Output(tvList: tvList,movieResult: movieResult)
    }
}
