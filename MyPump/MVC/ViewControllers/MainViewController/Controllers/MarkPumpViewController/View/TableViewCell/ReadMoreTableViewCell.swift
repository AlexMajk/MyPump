//
//  ReadMoreTableViewCell.swift
//  MyPump
//
//  Created by пользователь on 3/9/21.
//

import UIKit

class ReadMoreTableViewCell: UITableViewCell {

    @IBOutlet weak var separatorView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        separatorView.clipsToBounds = true
        separatorView.layer.cornerRadius = 10
        separatorView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
