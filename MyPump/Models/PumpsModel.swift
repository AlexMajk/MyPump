//
//  PumpsModel.swift
//  MyPump
//
//  Created by Александр Майко on 05.01.2021.
//

import Foundation
import ObjectMapper


class Pumps: Mappable {
    var models: String?
    
    required init?(map: Map) {

    }

    func mapping(map: Map) {
        models   <- map["1photo"]
    }
}
