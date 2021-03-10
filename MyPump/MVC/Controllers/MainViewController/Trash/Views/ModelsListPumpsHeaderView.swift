//
//  ModelsListPumpsHeaderView.swift
//  MyPump
//
//  Created by пользователь on 3/9/21.
//

import UIKit

class ModelsListPumpsHeaderView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
     func setTitleLabel(title: String){
        titleLabel.text = title
    }
}
