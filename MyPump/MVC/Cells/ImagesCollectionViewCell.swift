//
//  ImagesCollectionViewCell.swift
//  MyPump
//
//  Created by Александр Майко on 30.01.2021.
//

import UIKit
import FirebaseStorage
import Kingfisher

class ImagesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageFromCell: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let storage = Storage.storage()
    
    func configure(url: String) {
        storage.reference(forURL: url ).downloadURL { (url, error) in
            if let url = url {
                self.imageFromCell.kf.setImage(with: url)
            }
        }
    }
}
