//
//  FooterView.swift
//  MyPump
//
//  Created by Александр Майко on 10.03.2021.
//

import UIKit

class FooterView: UIView {
    @IBOutlet weak var ButtonOutlet: UIButton!
    @IBAction func AddToCardButton(_ sender: UIButton) {
        print("AddToCardButton tapped")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tintColor = .white
        backgroundColor = .systemBlue
//        self.ButtonOutlet.backgroundColor = .red
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
