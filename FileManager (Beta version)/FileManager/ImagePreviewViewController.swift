//
//  ImagePreviewViewController.swift
//  FileManager
//
//  Created by 김상준 on 8/6/24.
//

import UIKit

class ImagePreviewViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
    }
}
