//
//  CarModel.swift
//  MyPump
//
//  Created by пользователь on 1/21/21.
//


import Foundation
import ObjectMapper

class CarModel: Mappable {

    var color: String?
    var name: String?
    var photoURLString: String?
    var modelsList: [ModelsCar] = []
    
    required init?(map: Map) {
    }

    func mapping(map: Map) {
        color <- map["color"]
        name <- map["name"]
        photoURLString <- map["photo"]
        modelsList <- map["modelsList"]
    }
}


class ModelsCar: Mappable {

    var color: String?
    var name: String?
    var photo: String?
    var transmition: String?

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        color <- map["color"]
        name <- map["name"]
        photo <- map["photo"]
        transmition <- map["transmition"]
    }
}


