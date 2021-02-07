//
//  ImagesCollectionViewCollectionViewController.swift
//  MyPump
//
//  Created by Александр Майко on 30.01.2021.
//

import UIKit

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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return partListImageRef.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell4", for: indexPath) as! ImagesCollectionViewCell
        cell.configure(url: partListImageRef[indexPath.row])
        return cell
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let detailImageVC = segue.destination as? DetailImageViewController
//        else { return }
//        switch segue.identifier {
//        case "getDetailVC":
//            detailImageVC.image = selectedImageForShowDetail
//        default:
//            break
//        }
//    }
    
    deinit {
        print("deinit")
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "getDetailVC", sender: self)
    }
}

extension ImagesCollectionVC: UICollectionViewDelegateFlowLayout {
    
    
    // КАК ВКЛЮЧИТЬ АКТИВИТИ ИНДИКАТОР

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = sectionsInsets.left * (itemsPerRow + 1)
        let itemWidth = (collectionView.frame.width - paddingWidth) / itemsPerRow
        let itemHight = itemWidth
        return CGSize(width: itemWidth, height: itemHight)
    }
}
