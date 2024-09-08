//  ViewController.swift
//  BasicCompositionalLayout
//
//  Created by 김상준 on 9/8/24.


import UIKit

class ViewController: UIViewController {
    let imageUrl = "https://img.khan.co.kr/news/2021/11/18/l_2021111801002540300224911.jpg"
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    private var dataSource: UICollectionViewDiffableDataSource<Section,Item>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.id)
        collectionView.register(NormalCarouselCollectionViewCell.self, forCellWithReuseIdentifier: NormalCarouselCollectionViewCell.id)
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        
        setDataSource()
        setSnapShot()
    }
    
    private func setUI(){
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setSnapShot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section,Item>()
        
        snapshot.appendSections([Section(id: "Banner")])
        let bannerItems = [
            Item.banner(HomeItem(title: "교촌 치킨", imageUrl: "https://img.khan.co.kr/news/2021/11/18/l_2021111801002540300224911.jpg")),
            Item.banner(HomeItem(title: "굽네 치킨", imageUrl: "https://m.ftscrt.com/food/3449ea66-01a9-45bc-aee4-a5c0227626b0_lg_sq.jpg")),
            Item.banner(HomeItem(title: "푸라닥 치킨", imageUrl: "https://www.puradakchicken.com/upload/menu/마불로_악마_web0.jpg")),
        ]
        
        snapshot.appendItems(bannerItems,toSection: Section(id: "Banner"))
        
        let normalSection = Section(id: "NormalCarosel")
        snapshot.appendSections([normalSection])
        let normalItems = [
            Item.normalCarousel(HomeItem(title: "교촌 치킨",subTitle:"간장 치킨" ,imageUrl: imageUrl)),
            Item.normalCarousel(HomeItem(title: "굽네 치킨",subTitle:"오븐 치킨" ,imageUrl: imageUrl)),
            Item.normalCarousel(HomeItem(title: "푸라닥 치킨",subTitle:"차이니즈 치킨" ,imageUrl: imageUrl)),
            Item.normalCarousel(HomeItem(title: "후라이드 참 잘하는 집",subTitle:"후라이드 치킨" ,imageUrl: imageUrl)),
            Item.normalCarousel(HomeItem(title: "페리카나",subTitle:"양념 후라이드 반반 치킨" ,imageUrl: imageUrl)),
            Item.normalCarousel(HomeItem(title: "BHC",subTitle:"뿌링클 치킨" ,imageUrl: imageUrl))
        ]
        snapshot.appendItems(normalItems, toSection: normalSection)
        dataSource?.apply(snapshot)
    }
    
    private func setDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Section,Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            switch itemIdentifier {
            case .banner(let item):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.id, for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell()}
                cell.config(title:item.title ,imageUrl:item.imageUrl)
                return cell
            case .normalCarousel(let item):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NormalCarouselCollectionViewCell.id, for: indexPath) as? NormalCarouselCollectionViewCell else { return UICollectionViewCell()}
                cell.config(imageUrl: item.imageUrl, title: item.title, subTitle: item.subTitle)
                return cell
            default:
                return UICollectionViewCell()
                
            }
            
        })
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 30
        
        return UICollectionViewCompositionalLayout(sectionProvider: {[weak self] sectionIndex, _ in
            
            switch sectionIndex {
            case 0:
                return self?.createBannerSection()
            case 1:
                return self?.createNormalCarouselSection()
            default:
                return self?.createBannerSection()
            }
            
        },configuration: config)
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
    
    private func createNormalCarouselSection() -> NSCollectionLayoutSection {
        
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .absolute(180))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
}
/*
 1. 추가적으로 해야할 일
 2. 컬렉션 뷰 cell UI - 등록
 3. 레이아웃 구현 - 3가지
 4. datasource -> cellProvider
 5. snapshot -> datasource.apply(snapshot)
 */
