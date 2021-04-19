//
//  ShoppingBagTableViewCell.swift
//  MyPump
//
//  Created by Александр Майко on 20.03.2021.
//

import UIKit

protocol CartTableViewCellDelegate: class {
    func deleteButton(row: Int)
}

class CartTableViewCell: UITableViewCell {
    
    weak var delegate: CartTableViewCellDelegate?
    
    @IBOutlet weak var cartTableViewCellObjectName: UILabel!
    @IBOutlet weak var cartTableViewCellImage: UIImageView!
    @IBOutlet weak var cartTableViewCellObjectCode: UILabel!
    @IBOutlet weak var cartTableViewCellObjectCount: UILabel!
    
    var indexOfCell = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        delegate?.deleteButton(row:indexOfCell)//передаем при нажатии значение ячейки (оно присваивается ячейке при инициализации, представляет собой порядковый номер)
        
    }
    func configure(data: ObjectFromPartsCatalogueList, row: Int) {
//        self.activityIndicator.startAnimating()
//        self.activityIndicator.isHidden = false
        self.indexOfCell = row// здесь мы сетаем в значение ячейки row значение порядкового номера при инициализации ячейки
        if let name = data.objectFromPartsCatalogueListName {
            self.cartTableViewCellObjectName.text = name }
        if let code = data.objectFromPartsCatalogueListCode {
            self.cartTableViewCellObjectCode.text = "Артикул: \(code)"
        }

        self.cartTableViewCellObjectCount.text = "\(data.countOfCurrentObjectInShoppingCart)"
        guard let url = URL(string: data.objectFromPartsCatalogueListUrlImage!) else { return }
        DispatchQueue.main.async {
            self.cartTableViewCellImage.kf.setImage(
                with: url,
                options: [
                    .loadDiskFileSynchronously,
                    .cacheOriginalImage,
                    .transition(.fade(0.25)),
                ],
                progressBlock: { receivedSize, totalSize in},
                completionHandler: { result in
//                    self.activityIndicator.stopAnimating()
//                    self.activityIndicator.isHidden = true
                })
        }

    }
    
}
