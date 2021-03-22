//
//  FooterView.swift
//  MyPump
//
//  Created by Александр Майко on 10.03.2021.
//

import UIKit

protocol ButtonDelegate: class {
    func addToShoppingBagTapped(sender: UIButton)
}

class FooterView: UIView {
    
    weak var delegate: ButtonDelegate?
    
    @IBOutlet weak var ButtonOutlet: UIButton!
    
    @IBAction func AddToCardButton(_ sender: UIButton) {
        addToShoppingBagTapped(sender: ButtonOutlet)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tintColor = .white
        backgroundColor = .systemBlue
    }
    
    func addToShoppingBagTapped(sender: UIButton) {
           delegate?.addToShoppingBagTapped(sender: ButtonOutlet)
       }

}
