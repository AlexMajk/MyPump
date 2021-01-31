//
//  ImagesCollectionViewCell.swift
//  MyPump
//
//  Created by Александр Майко on 30.01.2021.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageFromCell: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    func activateIndicator(){
        self.activityIndicator.startAnimating()
    }
    
    func disactivateIndicator(){
        self.activityIndicator.stopAnimating()
        
    }
    
}
