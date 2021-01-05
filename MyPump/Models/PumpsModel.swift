//
//  PumpsModel.swift
//  MyPump
//
//  Created by Александр Майко on 05.01.2021.
//

import Foundation
import ObjectMapper


class Pumps: Mappable {
    var models: Any?
    var username: String?
    var age: Int?
    var weight: Double?
    var array: [Any]?
    var dictionary: [String : Any] = [:]
    var birthday: Date?

    required init?(map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
        models     <- map["Brinkmann"]
        username    <- map["username"]
        age         <- map["age"]
        weight      <- map["weight"]
        array       <- map["arr"]
        dictionary  <- map["dict"]
    }
}
