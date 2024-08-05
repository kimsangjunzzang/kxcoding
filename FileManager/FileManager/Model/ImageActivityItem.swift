//
//  ImageActivityItem.swift
//  FileManager
//
//  Created by 김상준 on 8/6/24.
//

import UIKit
import LinkPresentation
import UniformTypeIdentifiers

class ImageActivityItem: NSObject, UIActivityItemSource {
    let image: UIImage
    let title: String
    let subtitle: String?
    
    init(image: UIImage, title: String, subtitle: String? = nil) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
    }
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController
    ) -> Any {
        return title
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return image
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, subjectForActivityType activityType: UIActivity.ActivityType?) -> String {
        return title
    }
    func activityViewController(_ activityViewController: UIActivityViewController, dataTypeIdentifierForActivityType activityType: UIActivity.ActivityType?) -> String {
        return UTType.image.identifier
    }
    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        let metadata = LPLinkMetadata()
        metadata.title = title
        metadata.iconProvider = NSItemProvider(object: UIImage(systemName: "photo")!)
        if let subtitle {
            metadata.originalURL = URL(fileURLWithPath: subtitle)
        }
        return metadata
    }
    
}
