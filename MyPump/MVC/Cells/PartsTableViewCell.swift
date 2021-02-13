//
//  PartsTableViewCell.swift
//  MyPump
//
//  Created by Александр Майко on 13.02.2021.
//

import UIKit

class PartsTableViewCell: UITableViewCell {
    @IBOutlet weak var goToNextVcImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.goToNextVcImage.tintColor = ColorsScheme.col1
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
