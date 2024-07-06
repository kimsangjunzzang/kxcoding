//
//  ComposeViewController.swift
//  Days
//
//  Created by 김상준 on 7/6/24.
//

import UIKit

class ComposeViewController: UIViewController {
    
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
    
    @IBOutlet weak var titleField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
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
        }
    }
}

extension ComposeViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        
    }
    
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        
    }
}
