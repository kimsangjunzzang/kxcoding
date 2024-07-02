//
//  EventTableViewCell.swift
//  Days
//
//  Created by 김상준 on 7/3/24.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
