//
//  ViewController.swift
//  Days
//
//  Created by 김상준 on 7/2/24.
//

import UIKit

class ViewController: UIViewController{
    
    
    @IBOutlet weak var eventTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: .eventDidInsert, object: nil, queue: .main) { _ in
            self.eventTableView.reloadData()
            
        }
        
    }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int
    ) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: EventTableViewCell.self),
            for:indexPath) as! EventTableViewCell
        
        let target = events[indexPath.row]
        cell.iconImageView.image = target.iconImage
        cell.titleLabel.text = target.title
        cell.datelabel.text = target.dateString
        cell.daysLabel.text = target.daysString
        
        cell.containerView.backgroundColor = target.backgroundColor
        cell.titleLabel.textColor = target.textColor
        cell.datelabel.textColor = target.textColor
        cell.daysLabel.textColor = target.textColor
        
        return cell
    }
    
    
}
