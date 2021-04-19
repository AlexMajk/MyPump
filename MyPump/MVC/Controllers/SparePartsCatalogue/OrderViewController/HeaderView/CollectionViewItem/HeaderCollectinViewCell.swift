//
//  ImageHeaderCollectionViewCell.swift
//  MyPump
//
//  Created by Александр Майко on 09.03.2021.
//

import UIKit

class HeaderCollectinViewCell: UICollectionViewCell {
    @IBOutlet weak var headerCollectionViewCellImage: UIImageView!
    
    func configure(data: ObjectFromPartsCatalogueList) {
        //        self.activityIndicator.startAnimating()
        //        self.activityIndicator.isHidden = false
        //        self.ImageNameLabel.text = data.objectFromPartsCatalogueListName
        guard let url = URL(string: data.objectFromPartsCatalogueListUrlImage!) else { return }
        DispatchQueue.main.async {
            self.headerCollectionViewCellImage.kf.setImage(
                with: url,
                options: [
                    .loadDiskFileSynchronously,
                    .cacheOriginalImage,
                    .transition(.fade(0.25)),
                ],
                progressBlock: { receivedSize, totalSize in},
                completionHandler: { result in
                    //                    self.activityIndicator.stopAnimating()
                    //                    self.activityIndicator.isHidden = true
                })
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
