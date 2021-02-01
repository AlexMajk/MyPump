////
////  CashingData.swift
////  MyPump
////
////  Created by Александр Майко on 31.01.2021.
////
//
import Foundation
import UIKit
import FirebaseStorage
//
let imageCashe = NSCache<AnyObject, AnyObject>()
//
//extension UIImageView {
//    func loadImageUsingCashWithStorageReference(reference: StorageReference){
//        if let cashedImage = imageCashe.object(forKey: reference) as? UIImage {
//            self.image = cashedImage
//            return
//        }
//
//        reference.getData(maxSize: 1*1024*1024) { (data, error) in
//            if error != nil {
//                print ("Oh,no!\(String(describing: error))")
//                return
//            }
//            DispatchQueue.main.async {
//                if let dowloadedImage = UIImage(data: data!){
//                    imageCashe.setObject(dowloadedImage, forKey: reference)
//                    self.image = dowloadedImage
//                }
//            }
//        }
//    }
//
//}
