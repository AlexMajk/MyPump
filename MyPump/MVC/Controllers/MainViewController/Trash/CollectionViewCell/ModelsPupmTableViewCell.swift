//
//  ModelsPupmTableViewCell.swift
//  MyPump
//
//  Created by пользователь on 3/9/21.
//

import UIKit

class ModelsPupmTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var titleModelPumps: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
