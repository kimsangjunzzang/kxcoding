//
//  RoundedCollectionViewCell.swift
//  PlanetPedia
//
//  Created by 김상준 on 7/12/24.
//

import UIKit

class RoundedCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.subviews.first?.layer.cornerRadius = 20
        contentView.subviews.first?.clipsToBounds = true
    }
}
