//
//  ImageListViewController.swift
//  HelloOperation
//
//  Created by 김상준 on 7/15/24.
//

import UIKit

class ImageListViewController: UIViewController {
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    let backgroundQueue = OperationQueue()
    let mainQueue = OperationQueue.main
    
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
        
        backgroundQueue.maxConcurrentOperationCount = 100000
    }
    
    
    @IBAction func cancelOperation(_ sender: Any) {
        mainQueue.cancelAllOperations()
        backgroundQueue.cancelAllOperations()
    }
    
    @IBAction func startOperation(_ sender: Any) {
        
        var uiOperations = [Operation]()
        var backgroundOperations = [Operation]()
        
        let reloadOp = ReloadOperation(collectionView: imageCollectionView)
        uiOperations.append(reloadOp)
        
        for index in 0...20 {
            let data = ds.list[index]
            
            let downloadOp = DownloadOperation(target: data)
            reloadOp.addDependency(downloadOp)
            backgroundOperations.append(downloadOp)
            
            let filterOp = FilterOperation(target: data)
            filterOp.addDependency(reloadOp)
            backgroundOperations.append(filterOp)
            
            let reloadItemOp = ReloadOperation(collectionView: imageCollectionView, indexPath: IndexPath(item: index, section: 0))
            
            reloadItemOp.addDependency(filterOp)
            uiOperations.append(reloadItemOp)
        }
        backgroundQueue.addOperations(backgroundOperations,waitUntilFinished: false)
        mainQueue.addOperations(uiOperations, waitUntilFinished: false)
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
