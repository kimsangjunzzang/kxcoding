//
//  ViewController.swift
//  TVMOVIE
//
//  Created by 김상준 on 9/9/24.
//
/*
 Kingfisher: 다운로드하고 이미지를 캐싱한다. 이로써 이미지를 다루는데 있어 좀더 쉽게 다룰수 있도록 해준다.
 이미지를 URL 기반으로 사용하려 할때, 주로 사용 된다 ( 다운로드 받지 않고 사용하기 위해서 )
 
 스냅킷 : 스토리보드가 아닌 코드를 기반으로 개발을 진행할때, 조금 더 편리하게 사용할 수 있도록 만들어주는 프레임워크이다.
 
 RxSwift: 사용자가 이벤트를 발생시킬때, 비동기 작업을 도와줍니다.
 
 서버로부터 어떤 데이터를 요청 했더니, 1초 뒤에 응답이 왔다. 그러면 데이터가 Observable 안으로 들어오게 됩니다.
 해당 옵져버블을 구독하고 있던 Subscriber가 들어온 데이터를 가지고 특정 작업을 하게됩니다.
 
 서버에 데이터를 요청할때 알럼파이어를 자주 사용하게 된다. 요청한 데이터의 형태가 옵져버블 형태로 받게 된다.
 따라서 좀 더 쉽게 rx를 다룰 수 있게 됩니다.
 */
import UIKit
import SnapKit
import RxSwift

class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    let buttonView = ButtonView()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout:UICollectionViewLayout())
    let viewModel = ViewModel()
    
    // Subject - 이벤트를 발생 시키면서 Observable 형태도 되는 것
    let tvTrigger = PublishSubject<Void>()
    let movieTrigger = PublishSubject<Void>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bindViewModel()
        bindView()
        tvTrigger.onNext(()) // 버튼을 누르지 않아도 자동으로 불러온다.
    }
    
    private func setUI(){
        self.view.addSubview(buttonView)
        self.view.addSubview(collectionView)
        
        
        collectionView.backgroundColor = .black
        
        buttonView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.top.equalTo(buttonView.snp.bottom)
        }
    }
    
    private func bindViewModel() {
        let input = ViewModel.Input(tvTrigger: tvTrigger.asObservable(), movieTrigger: movieTrigger.asObservable())
        let output = viewModel.transform(input: input)
        
        output.tvList.bind { tvList in
            print("TV List \(tvList)")
            
        }.disposed(by: disposeBag)
        
        output.movieResult.bind{ movieResult in
            print("Movie Result \(movieResult)")
        }.disposed(by: disposeBag)
    }
    
    private func bindView() {
        // 순환 참조를 일으킬 수 있기 때문에 약한 참조를 한다.
        buttonView.tvButton.rx.tap.bind{ [weak self] in
            self?.tvTrigger.onNext(Void())
            
        }.disposed(by: disposeBag)
        
        buttonView.movieButton.rx.tap.bind { [weak self] in
            self?.movieTrigger.onNext(Void())
        }.disposed(by: disposeBag)
    }
}

