//
//  SecondCollectionViewCell.swift
//  MyPump
//
//  Created by Александр Майко on 24.04.2021.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var secondViewControllerImage: UIImageView!
    
    func configure(data: SecondCatalogueMachineryList) {
        //self.activityIndicator.startAnimating()
       // self.activityIndicator.isHidden = false
        //self.ImageNameLabel.text = data.objectFromPartsCatalogueListName
        guard let url = URL(string: data.secondCatalogueMachineryImageURL!) else { return }
        DispatchQueue.main.async {
            self.secondViewControllerImage.kf.setImage(
                with: url,
                options: [
                    .loadDiskFileSynchronously,
                    .cacheOriginalImage,
                    .transition(.fade(0.25))
                ],
                progressBlock: { _, _ in },
                completionHandler: { _ in
                    //self.activityIndicator.stopAnimating()
                    //self.activityIndicator.isHidden = true
                })
        }
    }

}
