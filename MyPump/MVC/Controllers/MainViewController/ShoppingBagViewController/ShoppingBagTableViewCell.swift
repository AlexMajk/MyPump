//
//  ShoppingBagTableViewCell.swift
//  MyPump
//
//  Created by Александр Майко on 20.03.2021.
//

import UIKit

class ShoppingBagTableViewCell: UITableViewCell {
    @IBOutlet weak var shoppingBagTableViewCellLabel: UILabel!
    @IBOutlet weak var shoppingBagTableViewCellImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(data: ObjectFromPartsCatalogueList) {
//        self.activityIndicator.startAnimating()
//        self.activityIndicator.isHidden = false
        self.shoppingBagTableViewCellLabel.text = data.objectFromPartsCatalogueListName
        guard let url = URL(string: data.objectFromPartsCatalogueListURLImage!) else { return }
        DispatchQueue.main.async {
            self.shoppingBagTableViewCellImage.kf.setImage(
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
