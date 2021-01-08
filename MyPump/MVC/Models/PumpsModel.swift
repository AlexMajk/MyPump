//
//  PumpsModel.swift
//  MyPump
//
//  Created by Александр Майко on 05.01.2021.
//

import Foundation
import ObjectMapper

class Model: Mappable {
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

//class Photo: NSObject {
//    var photo: String?
//}
