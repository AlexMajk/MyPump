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
    
    @IBAction func AddToCardButton(_ sender: UIButton) {
        delegate?.addToCartTapped(sender: sender)
    }
    
    func configure() {
        self.backgroundColor = .red
    }

}
