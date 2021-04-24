//
//  SecondViewController.swift
//  MyPump
//
//  Created by Александр Майко on 31.03.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    var dataForSecond: SecondCatalogueMachineryList?
    @IBOutlet weak var secondViewControllerCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        secondViewControllerCollectionView.register(UINib(nibName: String(describing: SecondCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: SecondCollectionViewCell.self))
    }
}

 extension SecondViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = secondViewControllerCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SecondCollectionViewCell.self), for: indexPath) as! SecondCollectionViewCell
        if let dataForSecond = dataForSecond {
        cell.configure(data: dataForSecond)
        }
        return cell
    }
    
 }

extension SecondViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2 // ячеек на ряд
        let paddingWidth = 5 * (itemsPerRow + 1)
        let avilableWith = collectionView.frame.width - paddingWidth // доступная ширина для нашего использования
        let itemWidth = avilableWith / itemsPerRow

        return CGSize(width: itemWidth, height: (itemWidth + 20))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
}
