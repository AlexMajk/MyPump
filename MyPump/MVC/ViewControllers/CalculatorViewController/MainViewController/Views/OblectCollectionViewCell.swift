//
//  OblectCollectionViewCell.swift
//  MyPump
//
//  Created by пользователь on 3/13/21.
//

import UIKit

class OblectCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    
    func configure(data: SpareModel) {
        configureUI()
        setData(data: data)
    }
    
    private func configureUI() {
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 10
        containerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]
    }
    
    private func setData(data: SpareModel) {
        titleLabel.text = data.name
        subTitleLabel.text = data.subtitle
        if let imageName = data.imageName {
            let image = UIImage(named: imageName)
           imageView.image = image
        }
    }
}
