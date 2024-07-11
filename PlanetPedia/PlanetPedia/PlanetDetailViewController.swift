//
//  PlanetDetailViewController.swift
//  PlanetPedia
//
//  Created by 김상준 on 7/10/24.
//

import UIKit

class PlanetDetailViewController: UIViewController {
    
    @IBOutlet weak var detailCollectionView: UICollectionView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    private let planet: Planet
    
    init?(planet: Planet, coder: NSCoder) {
        self.planet = planet
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            switch sectionIndex {
            case 1:
                var size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(130))
                var item = NSCollectionLayoutItem(layoutSize: size)
                
                size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(130))
                
                var group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
                
                group.interItemSpacing = NSCollectionLayoutSpacing.flexible(20)
                
                size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(130))
                item = NSCollectionLayoutItem(layoutSize: size)
                
                group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [group,item])
                group.interItemSpacing = NSCollectionLayoutSpacing.fixed(20)
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
                section.interGroupSpacing = 20
                
                return section
                
            default:
                let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200))
                let item = NSCollectionLayoutItem(layoutSize: size)
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
                section.interGroupSpacing = 20
                
                return section
            }
            
        }
        detailCollectionView.collectionViewLayout = layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img = UIImage(named: planet.englishName.lowercased())
        backgroundImageView.image = img
        
        setupLayout()
    }
}
extension PlanetDetailViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return planet.satellites.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PlanetSummaryCollectionViewCell.self), for: indexPath) as! PlanetSummaryCollectionViewCell
            
            cell.korNameLabel.text = planet.koreanName
            cell.engNameLabel.text = planet.englishName
            cell.descriptionLabel.text = planet.description
            
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PlanetInfoCollectionViewCell.self), for: indexPath) as! PlanetInfoCollectionViewCell
            
            switch indexPath.item {
            case 0:
                cell.titileImageView.image = UIImage(systemName: "ruler")
                cell.titleLabel.text = "크기"
                cell.valueLabel.text = planet.sizeString
                cell.unitLabel.text = "km"
            case 1:
                cell.titileImageView.image = UIImage(systemName: "arrow.circlepath")
                cell.titleLabel.text = "공전 주기"
                cell.valueLabel.text = planet.orbitalPeriodString
                cell.unitLabel.text = planet.orbitalPeriod > 365 ? "년":"일"
            case 2:
                cell.titileImageView.image = UIImage(systemName: "airplane")
                cell.titleLabel.text = "지구와의 거리"
                cell.valueLabel.text = planet.distanceString
                cell.unitLabel.text = "km"
                
            default:
                break
            }
            
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SatelliteCollectionViewCell.self), for: indexPath) as! SatelliteCollectionViewCell
            
            
            let target = planet.satellites[indexPath.item]
            cell.satelliteNameLabel.text = target.koreanName
            cell.satelliteSummarylabel.text = target.summary
            
            return cell
            
        default:
            fatalError("check section count")
        }
    }
    
    
}
