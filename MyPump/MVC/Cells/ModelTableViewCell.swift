//
//  ModelTableViewCell.swift
//  MyPump
//
//  Created by Александр Майко on 13.02.2021.
//

import UIKit

class ModelTableViewCell: UITableViewCell {
    @IBOutlet weak var goToNextVcImage: UIImageView!
    @IBOutlet weak var modelNameLabel: UILabel!
    @IBOutlet weak var modelDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.goToNextVcImage.tintColor = AppColors.detailsColor
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
