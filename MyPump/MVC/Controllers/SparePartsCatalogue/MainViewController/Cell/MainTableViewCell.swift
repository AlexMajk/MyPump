//
//  MarkTableViewCell.swift
//  MyPump
//
//  Created by Александр Майко on 08.01.2021.
//

import UIKit
import Kingfisher

class MainTableViewCell: UITableViewCell {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var mainCataloguePartsListCellNameLabel: UILabel!
    @IBOutlet weak var mainCataloguePartsListCellDescriptionLabel: UILabel!
    @IBOutlet weak var mainCataloguePartsListCellImage: UIImageView!

    func configureCell(data: CatalogueParts) {
        self.mainCataloguePartsListCellNameLabel.textColor = .black
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = false
        guard let mainCataloguePartsListName = data.mainCataloguePartsListName else {return}
//        guard let markName = data.mainListTitle else {return}
        self.mainCataloguePartsListCellNameLabel.text = mainCataloguePartsListName
        guard let mainCataloguePartsListDescription = data.mainCataloguePartsListDescription else {return}
        self.mainCataloguePartsListCellDescriptionLabel.text = mainCataloguePartsListDescription

        guard let url = URL(string: data.mainCataloguePartsListImageUrl!) else { return }
        DispatchQueue.main.async {
            self.mainCataloguePartsListCellImage.kf.setImage(
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
