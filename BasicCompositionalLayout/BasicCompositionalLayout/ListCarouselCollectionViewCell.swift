//
//  ListCarouselCollectionViewCell.swift
//  BasicCompositionalLayout
//
//  Created by 김상준 on 9/9/24.
//

import UIKit
import SnapKit
import Kingfisher

class ListCarouselCollectionViewCell: UICollectionViewCell {
    
    static let id = "ListCarouselCell"
    
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let mainImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    private func setUI(){
        //SnapKit
        self.addSubview(mainImage)
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        
        //constraint 적용
        mainImage.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalTo(60)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(mainImage.snp.trailing).offset(8)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(mainImage.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
        }
    }
    
    public func config(imageUrl: String,title: String,subTitle: String?){
        // title, iamge set
        titleLabel.text = title
        subTitleLabel.text = subTitle
        let url = URL(string: imageUrl)
        mainImage.kf.setImage(with: url)
        
        //image url
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
