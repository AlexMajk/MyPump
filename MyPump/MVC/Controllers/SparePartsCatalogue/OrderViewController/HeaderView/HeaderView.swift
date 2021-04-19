//
//  HeaderView.swift
//  MyPump
//
//  Created by Александр Майко on 07.03.2021.
//

import UIKit

protocol GetDetailVCDelegate: AnyObject {
    func getDetailVC(image: UIImage?)
}
class HeaderView: UIView {
    weak var delegate: GetDetailVCDelegate?

    var dataForHeaderCollectionViewCell: ObjectFromPartsCatalogueList?
    @IBOutlet weak var orderViewHeaderCollectionView: UICollectionView!

    func configureView() {
        orderViewHeaderCollectionView.delegate = self
        orderViewHeaderCollectionView.dataSource = self
        orderViewHeaderCollectionView.register(UINib(nibName: "HeaderCollectinViewCell", bundle: nil), forCellWithReuseIdentifier: "HeaderCollectinViewCell")
    }
}

extension HeaderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let indexPath = collectionView.indexPathsForSelectedItems?.first
        let cell = collectionView.cellForItem(at: indexPath!) as? HeaderCollectinViewCell
        let data = cell?.headerCollectionViewCellImage.image
        delegate?.getDetailVC(image: data)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: self.frame.width, height: self.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCollectinViewCell", for: indexPath) as! HeaderCollectinViewCell
        cell.configure(data: dataForHeaderCollectionViewCell!)
        return cell
    }
}
