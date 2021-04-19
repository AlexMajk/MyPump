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
    func configureCell(data: CatalogueMachinery) {
        self.mainMachineryNameLabel.textColor = .black
        //self.activityIndicator.startAnimating()
        //self.activityIndicator.isHidden = false
        guard let mainMachineryNameLabel = data.mainCatalogueMachineryName else {return}
//        guard let markName = data.mainListTitle else {return}
        self.mainMachineryNameLabel.text = mainMachineryNameLabel
        //guard let mainCataloguePartsListDescription = data.mainCataloguePartsListDescription else {return}
        //self.mainCataloguePartsListCellDescriptionLabel.text = mainCataloguePartsListDescription

        guard let url = URL(string: data.mainCatalogueMachineryImageURL!) else { return }
        DispatchQueue.main.async {
            self.mainMachineryImage.kf.setImage(
                with: url,
                options: [
                    .loadDiskFileSynchronously,
                    .cacheOriginalImage,
                    .transition(.fade(0.25)),
                ],
                progressBlock: { receivedSize, totalSize in},
                completionHandler: { result in
                   // self.activityIndicator.stopAnimating()
                    //self.activityIndicator.isHidden = true
                })
        }

    }
    

}
