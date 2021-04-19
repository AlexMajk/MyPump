//
//  FooterView.swift
//  MyPump
//
//  Created by Александр Майко on 10.03.2021.
//

import UIKit

protocol ButtonDelegate: class {
    func addToCartTapped(sender: UIButton)
}

class FooterView: UIView {
    
    weak var delegate: ButtonDelegate?
    
    @IBOutlet weak var footerButton: UIButton!
    @IBAction func AddToCardButton(_ sender: UIButton) {
        delegate?.addToCartTapped(sender: sender)
    }
    
    func configure() {
        footerButton.layer.cornerRadius = 10
        footerButton.backgroundColor = AppColors.detailsColor
        footerButton.layer.borderWidth = 2
        footerButton.layer.borderColor = AppColors.mainThemeColor.cgColor
        footerButton.setTitle("Добавить в корзину", for: .normal)
        footerButton.titleLabel?.tintColor = AppColors.mainThemeColor
        self.backgroundColor = .clear
    }
    
}
