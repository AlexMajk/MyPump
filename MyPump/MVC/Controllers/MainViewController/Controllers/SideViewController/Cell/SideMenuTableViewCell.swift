//
//  SideMenuTableViewCell.swift
//  MyPump
//
//  Created by пользователь on 3/12/21.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    func configureCell(title: String) {
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .white
    }
}
