//
//  MarkPumpsCollectionViewCell.swift
//  MyPump
//
//  Created by пользователь on 3/8/21.
//

import UIKit

class MarkPumpsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var separatorView: UIView!
    

    func configure(title: String, isSelected: Bool) {
        titleLabel.text = title
        separatorView.backgroundColor = isSelected ? #colorLiteral(red: 0.2980392157, green: 0.2980392157, blue: 0.1333333333, alpha: 1) : .clear
        titleLabel.font = isSelected ? titleLabel.font.withSize(20) : titleLabel.font.withSize(16)
    }
}
