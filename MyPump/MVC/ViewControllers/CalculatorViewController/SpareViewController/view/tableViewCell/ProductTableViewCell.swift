//
//  ProductTableViewCell.swift
//  MyPump
//
//  Created by пользователь on 3/19/21.
//

import UIKit

protocol ProductTableViewCellDelegate: class {
    func addPressButton(selectedProduct: ProductModel)
}

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    weak var delegate: ProductTableViewCellDelegate?
    private var product: ProductModel?
    
    func configure(data: ProductModel, isHiddenAddButton: Bool) {
        addButton.isHidden = isHiddenAddButton
        titleLabel.text = data.name
        product = data
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if let product = self.product {
            delegate?.addPressButton(selectedProduct: product)
        }
    }
}
