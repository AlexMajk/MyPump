//
//  MarkImageTableViewCell.swift
//  MyPump
//
//  Created by пользователь on 3/9/21.
//

import UIKit

protocol MarkImageTableViewCellDelegate: class {
    func returnContentOffsetCollectionView(contentOffSet: CGPoint)
}

class MarkImageTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var delegate: MarkImageTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MarkImageItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MarkImageItemCollectionViewCell")
    }
    
    func configure(number: Int) {

        let cellSize = CGSize(width: frame.size.width * 2, height: frame.size.height)//frame.size

        //get current content Offset of the Collection view
        let contentOffset = collectionView.contentOffset
        print(collectionView.contentOffset)

        if collectionView.contentSize.width <= collectionView.contentOffset.x + cellSize.width
        {
            let r = CGRect(x: 0, y: contentOffset.y, width: cellSize.width, height: cellSize.height)
            collectionView.scrollRectToVisible(r, animated: true)

        } else {
            let r = CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height)
            collectionView.scrollRectToVisible(r, animated: true);
        }
        
        print(collectionView.contentOffset)
    }
}

extension MarkImageTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarkImageItemCollectionViewCell", for: indexPath) as! MarkImageItemCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}
