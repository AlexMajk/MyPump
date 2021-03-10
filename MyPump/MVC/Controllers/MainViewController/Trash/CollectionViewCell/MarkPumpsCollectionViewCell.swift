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
        separatorView.backgroundColor = isSelected ? #colorLiteral(red: 0.9994722009, green: 0.9867805839, blue: 0.3154735565, alpha: 1) : .clear
        titleLabel.textColor = isSelected ? .white : .black
        titleLabel.font = isSelected ? titleLabel.font.withSize(20) : titleLabel.font.withSize(16)
    }
}
