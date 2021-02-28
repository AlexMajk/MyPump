//
//  PumpsModel.swift
//  MyPump
//
//  Created by Александр Майко on 05.01.2021.
//

import Foundation
import ObjectMapper
class Main: Mappable, Decodable {
    
    var markList: [MarkList]?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        markList <- map["markList"]
    }
}

class MarkList: Mappable, Decodable {
    
    var description: String?
    var modelList: [ModelList]?
    var name: String?
    var imageLogoUrl: String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        description <- map["description"]
        modelList <- map["modelList"]
        name <- map["name"]
        imageLogoUrl <- map["photoLogo"]
    }
}

class ModelList: Mappable, Decodable {
    
    var description: String?
    var name: String?
    var partList: [PartList]?
    var yearsOfRelease: String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        description <- map["description"]
        name <- map["name"]
        partList <- map["partList"]
        yearsOfRelease <- map["years of release"]
    }
}

class PartList: Mappable, Decodable {
    
    var name: String?
    var photo: [String]?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        photo <- map["photo"]
    }
//class Photo: NSObject {
//    var photo: String?
//}
}
