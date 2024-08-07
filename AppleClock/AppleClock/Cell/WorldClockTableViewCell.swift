//
//  WorldClockTableViewCell.swift
//  AppleClock
//
//  Created by 김상준 on 7/8/24.
//

import UIKit

class WorldClockTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var timeOffsetLabel: UILabel!
    @IBOutlet weak var timeZoneLabel: UILabel!
    @IBOutlet weak var timePeriodLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool
    ) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func setEditing(_ editing: Bool, animated: Bool
    ) {
        super.setEditing(editing, animated: animated)
        
        timePeriodLabel.isHidden = editing
        timeLabel.isHidden = editing
    }
}
