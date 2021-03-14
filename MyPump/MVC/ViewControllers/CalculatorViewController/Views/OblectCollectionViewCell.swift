//
//  OblectCollectionViewCell.swift
//  MyPump
//
//  Created by пользователь on 3/13/21.
//

import UIKit

class OblectCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    func configure() {
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 10
        containerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]
        
//        imageView.image = UIImage(named: "Putzmeister")
    }
}
