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
        separatorView.backgroundColor = isSelected ? #colorLiteral(red: 1, green: 0.7725490196, blue: 0, alpha: 1) : .clear
        titleLabel.textColor = isSelected ? .white : .lightGray
        titleLabel.font = isSelected ? titleLabel.font.withSize(24) : titleLabel.font.withSize(16)
    }
}
