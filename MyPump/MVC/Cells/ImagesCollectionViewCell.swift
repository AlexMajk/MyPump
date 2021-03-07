//
//  ImagesCollectionViewCell.swift
//  MyPump
//
//  Created by Александр Майко on 30.01.2021.
//

import UIKit
import Kingfisher

class ImagesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageFromCell: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var ImageNameLabel: UILabel!
    
//    let fbManager = FBDataManager.shared
    
    func configure(url: String) {
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = false
        guard let url = URL(string: url) else { return }
        DispatchQueue.main.async {
            self.imageFromCell.kf.setImage(
                with: url,
                options: [
                    .loadDiskFileSynchronously,
                    .cacheOriginalImage,
                    .transition(.fade(0.25)),
                ],
                progressBlock: { receivedSize, totalSize in},
                completionHandler: { result in
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                })
        }

    }
}
