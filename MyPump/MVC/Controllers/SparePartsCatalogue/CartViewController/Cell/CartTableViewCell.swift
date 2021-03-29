//
//  ShoppingBagTableViewCell.swift
//  MyPump
//
//  Created by Александр Майко on 20.03.2021.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var cartTableViewCellLabel: UILabel!
    @IBOutlet weak var cartTableViewCellImage: UIImageView!
    
    
    
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
        self.cartTableViewCellLabel.text = data.objectFromPartsCatalogueListName
        guard let url = URL(string: data.objectFromPartsCatalogueListUrlImage!) else { return }
        DispatchQueue.main.async {
            self.cartTableViewCellImage.kf.setImage(
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
