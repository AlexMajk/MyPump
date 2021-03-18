//
//  ProductModel.swift
//  MyPump
//
//  Created by пользователь on 3/19/21.
//

import Foundation

struct ProductModel {
    
    var id: Int = 0
    var name: String {
        return "товар № \(id)"
    }
    
    
    init () {
        id = Int(arc4random_uniform(1000000))
    }
}
