//
//  ModelsListPumpsHeaderView.swift
//  MyPump
//
//  Created by пользователь on 3/9/21.
//

import UIKit

class ModelsListPumpsHeaderView: UIView {
   
    class func configure() -> ModelsListPumpsHeaderView {
        let header = UINib(nibName: "ModelsListPumpsHeaderView", bundle: .main).instantiate(withOwner: nil, options: nil).first as! ModelsListPumpsHeaderView
        return header
    }

    
    
}
