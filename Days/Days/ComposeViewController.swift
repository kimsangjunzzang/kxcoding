//
//  ComposeViewController.swift
//  Days
//
//  Created by 김상준 on 7/6/24.
//

import UIKit

extension Notification.Name {
    static let eventDidInsert = Notification.Name("eventDidInsert")
}

class ComposeViewController: UIViewController {
    
    var data: ComposeData?
    
    let colors: [UIColor] = [
        .systemRed,
        .systemOrange,
        .systemYellow,
        .systemGreen,
        .systemBlue,
        .systemPurple,
        .systemPink,
        .systemTeal,
        .systemIndigo,
        .systemGray,
        .black,
        .white
    ]

    @IBOutlet weak var backgroundColorCollectionView: UICollectionView!
    
    @IBOutlet weak var textColorCollectionView: UICollectionView!
    
    @IBOutlet weak var titleField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func save(_ sender: Any) {
        guard let title = titleField.text else {return}
        
        data?.title = title

        if let data {
            let event = Event(data: data)
            events.append(event)
            
            NotificationCenter.default.post(name: .eventDidInsert,object: nil)
            dismiss(animated: true)
        }
        
    }
}

extension ComposeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ColorCollectionViewCell.self), for: indexPath) as! ColorCollectionViewCell
        
        if indexPath.item == colors.count {
            cell.colorImageView.image = UIImage(named:"color-picker")
            cell.colorImageView.tintColor = nil
        } else {
            let target = colors[indexPath.item]
            cell.colorImageView.image = UIImage(named: "color-picker")?.withRenderingMode(.alwaysTemplate)
            cell.colorImageView.tintColor = target
        }
        return cell
    }
}

extension ComposeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == colors.count {
            let colorPicker = UIColorPickerViewController()
            colorPicker.title = collectionView == backgroundColorCollectionView ? "배경색" : "글자색"
            colorPicker.supportsAlpha = false
            colorPicker.delegate = self
            
            present(colorPicker,animated: true)
        } else {
            let target = colors[indexPath.item]
            
            if collectionView == backgroundColorCollectionView {
                data?.backgroundColor = target
            } else {
                data?.textColor = target
            }
        }
    }
}

extension ComposeViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        
    }
    
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        if !continuously {
            if viewController.title == "배경색" {
                data?.backgroundColor = color
            } else {
                data?.textColor = color
            }
        }
    }
}
