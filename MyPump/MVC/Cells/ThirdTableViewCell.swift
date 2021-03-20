//
//  PartsTableViewCell.swift
//  MyPump
//
//  Created by Александр Майко on 13.02.2021.
//

import UIKit

class ThirdTableViewCell: UITableViewCell {
    @IBOutlet weak var thirdCataloguePartsListCellImage: UIImageView!
    @IBOutlet weak var thirdCataloguePartsListCellNameLabel: UILabel!
    
    func configureCell(data: ThirdCataloguePartsList) {
        //self.secondCataloguePartsListCellNameLabel.textColor = .black
//        self.activityIndicator.startAnimating()
//        self.activityIndicator.isHidden = false
        //guard let secondListTitle = data.secondCataloguePartsListName else {return}
       // self.secondCataloguePartsListCellNameLabel.text = secondListTitle
        //guard let secondCellDescription = data.secondCataloguePartsListDescription else {return}
        //self.secondCataloguePartsListCellDescriptionLabel.text = secondCellDescription

        guard let url = URL(string: data.thirdCataloguePartsListImageURL!) else { return }
        self.thirdCataloguePartsListCellNameLabel.text = data.thirdCataloguePartsListName
        DispatchQueue.main.async {
            self.thirdCataloguePartsListCellImage.kf.setImage(
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

}
