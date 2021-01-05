//
//  PumpsModel.swift
//  MyPump
//
//  Created by Александр Майко on 05.01.2021.
//

import Foundation
import ObjectMapper

class Pumps: Mappable {
    var photo1: String?
    var photo2: String?
    var photo3: String?
    var photo4: String?
    
    required init?(map: Map) {

    }

    func mapping(map: Map) {
        photo1   <- map["1photo"]
        photo2   <- map["2photo"]
        photo3   <- map["3photo"]
        photo4   <- map["4photo"]
    }
}
