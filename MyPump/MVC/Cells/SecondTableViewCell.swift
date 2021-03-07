//
//  ModelTableViewCell.swift
//  MyPump
//
//  Created by Александр Майко on 13.02.2021.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    @IBOutlet weak var secondCellImage: UIImageView!
    @IBOutlet weak var secondCellNameLabel: UILabel!
    @IBOutlet weak var secondCellDescriptionLabel: UILabel!
//    @IBOutlet weak var goToNextVcImage: UIImageView!
//    @IBOutlet weak var modelNameLabel: UILabel!
//    @IBOutlet weak var modelDescriptionLabel: UILabel!
    
    func configureCell(data: CatalogueSecondList) {
        self.secondCellNameLabel.textColor = .white
//        self.activityIndicator.startAnimating()
//        self.activityIndicator.isHidden = false
        guard let secondListTitle = data.secondListTitle else {return}
        self.secondCellNameLabel.text = secondListTitle
        guard let secondCellDescription = data.description else {return}
        self.secondCellDescriptionLabel.text = secondCellDescription

        guard let url = URL(string: data.catalogueSecondListImageUrl!) else { return }
        DispatchQueue.main.async {
            self.secondCellImage.kf.setImage(
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
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
////        self.goToNextVcImage.tintColor = AppColors.detailsColor
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
