//
//  PumpsModel.swift
//  MyPump
//
//  Created by Александр Майко on 05.01.2021.
//

import Foundation
import ObjectMapper

class Mark: Mappable {
    var marks: [String]?
    var headerTitle: String?
//{"data":{"photo":["photo1","photo2"]}}
    
    required init?(map: Map) {

    }

    func mapping(map: Map) {
        marks   <- map["marks"]
        headerTitle  <- map["headerTitle"]

    }
}

class Model: Mappable {
    var models: [String]?
    var headerTitle: String?
//{"data":{"photo":["photo1","photo2"]}}
    
    required init?(map: Map) {

    }

    func mapping(map: Map) {
        models   <- map["brinkmannModels"]
        headerTitle  <- map["headerTitle"]

    }
}
//class Photo: NSObject {
//    var photo: String?
//}
