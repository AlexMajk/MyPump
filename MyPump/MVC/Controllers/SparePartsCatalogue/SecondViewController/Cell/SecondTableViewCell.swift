//
//  ModelTableViewCell.swift
//  MyPump
//
//  Created by Александр Майко on 13.02.2021.

import UIKit

class SecondTableViewCell: UITableViewCell {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var secondCataloguePartsListCellNameLabel: UILabel!
    @IBOutlet weak var secondCataloguePartsListCellDescriptionLabel: UILabel!
    @IBOutlet weak var secondCataloguePartsListCellImage: UIImageView!
    //    @IBOutlet weak var goToNextVcImage: UIImageView!
    //    @IBOutlet weak var modelNameLabel: UILabel!
    //    @IBOutlet weak var modelDescriptionLabel: UILabel!

    func configureCell(data: SecondCataloguePartsList) {
        self.secondCataloguePartsListCellNameLabel.textColor = .black
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = false
        guard let secondListTitle = data.secondCataloguePartsListName else { return }
        self.secondCataloguePartsListCellNameLabel.text = secondListTitle
        guard let secondCellDescription = data.secondCataloguePartsListDescription else { return }
        self.secondCataloguePartsListCellDescriptionLabel.text = secondCellDescription

        guard let url = URL(string: data.secondCataloguePartsListImageUrl!) else { return }
        DispatchQueue.main.async {
            self.secondCataloguePartsListCellImage.kf.setImage(
                with: url,
                options: [
                    .loadDiskFileSynchronously,
                    .cacheOriginalImage,
                    .transition(.fade(0.25))
                ],
                progressBlock: { _, _ in },
                completionHandler: { _ in
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                })
        }
    }
}
