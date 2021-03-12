//
//  ModelsListPumpsHeaderView.swift
//  MyPump
//
//  Created by пользователь on 3/9/21.
//

import UIKit

protocol ModelsListPumpsHeaderViewDelegate: class {
    func hiddenButtonPressed(section: Int)
}

class ModelsListPumpsHeaderView: UIView {
    
    @IBOutlet weak var showButton: UIButton!
    
    weak var delegate: ModelsListPumpsHeaderViewDelegate?
    var section = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func setTitleLabel(title: String, isShowCell: Bool){
        isShowCell ? showButton.setTitle("Свернуть", for: .normal) : showButton.setTitle("Развернуть", for: .normal)
        titleLabel.text = title
    }
    
    func setSectionInTableView(section: Int) {
        self.section = section
    }
    
    @IBAction func hiddenButtonPressed(_ sender: UIButton) {
        delegate?.hiddenButtonPressed(section: section)
    }
}
