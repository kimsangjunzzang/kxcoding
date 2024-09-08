//
//  ViewController.swift
//  BasicCompositionalLayout
//
//  Created by 김상준 on 9/8/24.
//

import UIKit

class ViewController: UIViewController {

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    private var dataSource: UICollectionViewDiffableDataSource<Section,Item>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
       
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.id)
        
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        setDataSource()
        setSnapShot()
    }
    private func setUI(){
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .red
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setSnapShot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section,Item>()
        
        snapshot.appendSections([Section(id: "Banner")])
        let bannerItems = [
            Item.banner(HomeItem(title: "교촌 치킨", imageUrl: "https://img.khan.co.kr/news/2021/05/09/l_2021051001000864600073041.jpg")),
            Item.banner(HomeItem(title: "굽네 치킨", imageUrl: "https://img.khan.co.kr/news/2021/05/09/l_2021051001000864600073041.jpg")),
            Item.banner(HomeItem(title: "푸라닥 치킨", imageUrl: "https://img.khan.co.kr/news/2021/05/09/l_2021051001000864600073041.jpg")),
        ]
        snapshot.appendItems(bannerItems,toSection: Section(id: "Banner"))
        dataSource?.apply(snapshot)
    }
    
    private func setDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Section,Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            switch itemIdentifier {
            case .banner(let item):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.id, for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell()}
                cell.config(title:item.title ,imageUrl:item.imageUrl)
                        return cell
            default:
                return UICollectionViewCell()
                
            }
           
        })
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout(sectionProvider: {[weak self] sectionIndex, _ in
            
            return self?.createBannerSection()
        })
    }
    
    private func createBannerSection() -> NSCollectionLayoutSection {
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
}

// 추가적으로 해야할 일
// 컬렉션 뷰 cell UI - 등록
// 레이아웃 구현 - 3가지
// datasource -> cellProvider
// snapshot -> datasource.apply(snapshot)
