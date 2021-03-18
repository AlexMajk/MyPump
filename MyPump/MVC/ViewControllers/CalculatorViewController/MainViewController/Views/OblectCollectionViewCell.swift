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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
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
            let image = UIImage(named: imageName)//?.imageResize(sizeChange: CGSize(width: 100, height: 100))
           imageView.image = image
        }
    }
}

extension UIImage {

    func imageResize (sizeChange:CGSize)-> UIImage{

        let hasAlpha = true
        let scale: CGFloat = 0.0 // Use scale factor of main screen

        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        self.draw(in: CGRect(origin: CGPoint.zero, size: sizeChange))

        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage!
    }

}
