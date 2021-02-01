//
//  ImagesCollectionViewCell.swift
//  MyPump
//
//  Created by Александр Майко on 30.01.2021.
//

import UIKit
import FirebaseStorage



class ImagesCollectionViewCell: UICollectionViewCell {
    

    
    @IBOutlet weak var imageFromCell: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    func loadImageUsingCashWithStorageReference(reference: StorageReference){
        self.activityIndicator.startAnimating()
        self.activityIndicator.hidesWhenStopped = true
            if let cashedImage = imageCashe.object(forKey: reference) as? UIImage {
                self.imageFromCell.image = cashedImage
                self.activityIndicator.stopAnimating()
                return
            }
            
            reference.getData(maxSize: 1*1024*1024) { (data, error) in
                if error != nil {
                    print ("Oh,no!\(String(describing: error))")
                    return
                }
                DispatchQueue.main.async {
                    if let dowloadedImage = UIImage(data: data!){
                        imageCashe.setObject(dowloadedImage, forKey: reference)
                        self.imageFromCell.image = dowloadedImage
                        self.activityIndicator.stopAnimating()
                    }
                }
            }
        }
}
