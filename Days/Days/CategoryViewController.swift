//
//  CategoryViewController.swift
//  Days
//
//  Created by 김상준 on 7/3/24.
//

import UIKit

class CategoryViewController: UIViewController {
    
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    func setUpLayout() {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .estimated(120))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(20)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        section.interGroupSpacing = 20
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        categoryCollectionView.collectionViewLayout = layout
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpLayout()
    }
    
}

extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Event.Category.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryCollectionViewCell.self), for: indexPath) as! CategoryCollectionViewCell
        
        let category = Event.Category.allCases[indexPath.row]
        cell.categoryImageView.image = UIImage(named: category.rawValue)
        cell.titleLabel.text = category.title
        
        return cell
    }
    
   
    
    
}
