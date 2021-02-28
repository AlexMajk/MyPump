//
//  MarkTableViewCell.swift
//  MyPump
//
//  Created by Александр Майко on 08.01.2021.
//

import UIKit
import Kingfisher

class MarkTableViewCell: UITableViewCell {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var markNameLabel: UILabel!
    @IBOutlet weak var markDescriptionLabel: UILabel!
    @IBOutlet weak var markImage: UIImageView!

    func configureCell(data: MarkList) {
        self.markNameLabel.textColor = .white
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = false
        guard let markName = data.name else {return}
        self.markNameLabel.text = markName
        guard let markDescription = data.description else {return}
        self.markDescriptionLabel.text = markDescription

        guard let url = URL(string: data.imageLogoUrl!) else { return }
        DispatchQueue.main.async {
            self.markImage.kf.setImage(
                with: url,
                options: [
                    .loadDiskFileSynchronously,
                    .cacheOriginalImage,
                    .transition(.fade(0.25)),
                ],
                progressBlock: { receivedSize, totalSize in},
                completionHandler: { result in
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                })
        }

    }
}
