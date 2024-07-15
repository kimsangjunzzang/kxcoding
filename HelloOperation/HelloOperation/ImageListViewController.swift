//
//  ImageListViewController.swift
//  HelloOperation
//
//  Created by 김상준 on 7/15/24.
//

import UIKit

class ImageListViewController: UIViewController {
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    var ds = PhotoDataSource()
    
    func setupLayout() {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3),
                                              heightDimension: .estimated(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        group.interItemSpacing = .flexible(10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10,bottom: 10, trailing: 10)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        imageCollectionView.collectionViewLayout = layout
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
}

extension ImageListViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int
    ) -> Int {
        return ds.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ImageCollectionViewCell.self),
                                                      for: indexPath) as! ImageCollectionViewCell
        cell.imageView.image = ds.list[indexPath.item].data
        return cell
    }
}
