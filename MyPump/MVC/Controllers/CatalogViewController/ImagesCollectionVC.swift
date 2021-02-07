//
//  ImagesCollectionViewCollectionViewController.swift
//  MyPump
//
//  Created by Александр Майко on 30.01.2021.
//

import UIKit
import Alamofire
import FirebaseFirestore
import FirebaseStorage
class ImagesCollectionVC: UICollectionViewController {

    var agregateTitle: String?
    var partListImageRef = [String]()
    var selectedImageForShowDetail : UIImage?
    let itemsPerRow: CGFloat = 2 //вынесли из метода, так как здесь удобнее вносить изменения
    let sectionsInsets = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10) // аналогично
    
    
    override func viewDidLoad() {
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    
    private func configureNavigationController() {
        let backButton = UIBarButtonItem()
        backButton.title = "к выбору узла"
        title = agregateTitle
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    //
    //    func showNextVC(detailImage: UIImage?) {
    //        guard let image = detailImage else {return}
    //        let storyboard = UIStoryboard(storyboard: .main)
    //        let detailsViewController: DetailsViewController = storyboard.instantiateViewController()
    //        detailsViewController.image = image
    //        navigationController?.pushViewController(detailsViewController, animated: true)
    //    }
}

extension ImagesCollectionVC: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return partListImageRef.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell4", for: indexPath) as! ImagesCollectionViewCell
        
        cell.configure(url: partListImageRef[indexPath.row])
        
        
        
//        let storage = Storage.storage()
//        let imageRef = storage.reference(forURL:"\(partListImageRef[indexPath.row])")
//        cell.loadImageUsingCashWithStorageReference(reference: imageRef)
//
//        cell.imageFromCell.loadImageUsingCashWithStorageReference(reference: imageRef)
        return cell
    }

    
    // КАК ВКЛЮЧИТЬ АКТИВИТИ ИНДИКАТОР
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let storage = Storage.storage()
//        let imageRef = storage.reference(forURL:"\(partListImageRef[indexPath.row])")
//        self.selectedImageForShowDetail = imageCashe.object(forKey: imageRef) as? UIImage
        performSegue(withIdentifier: "getDetailVC", sender: self)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = sectionsInsets.left * (itemsPerRow + 1)
        let itemWidth = (collectionView.frame.width - paddingWidth) / itemsPerRow
        let itemHight = itemWidth
        return CGSize(width: itemWidth, height: itemHight)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailImageVC = segue.destination as? DetailImageViewController
        else { return }
        
        switch segue.identifier {
        
        case "getDetailVC":
            detailImageVC.image = selectedImageForShowDetail
            
        default:
            break
        }
    }
}
