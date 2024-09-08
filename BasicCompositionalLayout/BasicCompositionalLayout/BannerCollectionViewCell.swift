//
//  BannerCollectionViewCell.swift
//  BasicCompositionalLayout
//
//  Created by 김상준 on 9/8/24.
//

import UIKit
import SnapKit

class BannerCollectionViewCell: UICollectionViewCell {
    static id = "BannerCell"
    
    let titleLabel = UILabel()
    let backgroundImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    private func setUI(){
        //SnapKit
        self.addSubview(titleLabel)
        self.addSubview(backgroundImage)
        
        //constraint 적용
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    public func config(title: String, imageUrl: String){
        // title, iamge set
        titleLabel.text = "Title"
        
        //image url
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
