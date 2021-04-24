//
//  MainMachineryCollectionViewCell.swift
//  MyPump
//
//  Created by Александр Майко on 28.03.2021.
//

import UIKit

class MainMachineryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainMachineryNameLabel: UILabel!
    @IBOutlet weak var mainMachineryImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
//    func configureOrderButton() {
//        orderButtonOutlet.layer.cornerRadius = 10// ????????
//        orderButtonOutlet.layer.borderWidth = 2
//        orderButtonOutlet.clipsToBounds = true
//        orderButtonOutlet.setBackgroundImage(AppColors.detailsColor.image(), for: .normal)
//        orderButtonOutlet.layer.borderColor = AppColors.mainThemeColor.cgColor
//        orderButtonOutlet.setBackgroundImage(UIColor.lightGray.image(), for: .disabled)
//        orderButtonOutlet.setTitle("добавить", for: .normal)
//    }
    func configureCell(data: CatalogueMachinery) {
//        self.mainMachineryView.layer.cornerRadius = 10
//        self.mainMachineryView.layer.borderWidth = 0.5
//        self.mainMachineryView.clipsToBounds = true
//        self.mainMachineryView.layer.borderColor = AppColors.mainThemeColor.cgColor
//        self.mainMachineryView.layer.shadowOpacity = 5
//        self.mainMachineryView.layer.shadowRadius = 5
//        self.mainMachineryView.layer.shadowColor = AppColors.detailsColor.cgColor
        self.mainMachineryNameLabel.textColor = .black
        // self.activityIndicator.startAnimating()
        // self.activityIndicator.isHidden = false
        guard let mainMachineryNameLabel = data.mainCatalogueMachineryName else { return }
//        guard let markName = data.mainListTitle else {return}
        self.mainMachineryNameLabel.text = mainMachineryNameLabel
        // guard let mainCataloguePartsListDescription = data.mainCataloguePartsListDescription else {return}
        // self.mainCataloguePartsListCellDescriptionLabel.text = mainCataloguePartsListDescription

        guard let url = URL(string: data.mainCatalogueMachineryImageURL!) else { return }
        DispatchQueue.main.async {
            self.mainMachineryImage.kf.setImage(
                with: url,
                options: [
                    .loadDiskFileSynchronously,
                    .cacheOriginalImage,
                    .transition(.fade(0.25))
                ],
                progressBlock: { _, _ in },
                completionHandler: { _ in
                   // self.activityIndicator.stopAnimating()
                    // self.activityIndicator.isHidden = true
                })
        }
    }
}
