//
//  PumpsModel.swift
//  MyPump
//
//  Created by Александр Майко on 05.01.2021.
//

import Foundation
import ObjectMapper

class Model: Mappable {
    var models: [String]?
//{"data":{"photo":["photo1","photo2"]}}
    
    required init?(map: Map) {

    }

    func mapping(map: Map) {
        models   <- map["models"]

    }
}

//class Photo: NSObject {
//    var photo: String?
//}
