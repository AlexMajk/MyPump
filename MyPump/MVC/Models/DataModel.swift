//
//  PumpsModel.swift
//  MyPump
//
//  Created by Александр Майко on 05.01.2021.
//

import Foundation
import ObjectMapper
class Main: Mappable, Decodable {
    
    var catalogueMainList: [CatalogueMainList]?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        catalogueMainList <- map["catalogueMainList"]
    }
}

class CatalogueMainList: Mappable, Decodable {
    
    var mainListTitle: String?
    var description: String?
    var catalogueMainListImageUrl : String?
    var catalogueSecondList: [CatalogueSecondList]?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        mainListTitle <- map["mainListTitle"]
        description <- map["description"]
        catalogueMainListImageUrl <- map["catalogueMainListImageUrl"]
        catalogueSecondList <- map["catalogueSecondList"]
        
    }
}

class CatalogueSecondList: Mappable, Decodable {
    
    var secondListTitle: String?
    var description: String?
    var catalogueSecondListImageUrl: String?
    var catalogueThirdList: [CatalogueThirdList]?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        secondListTitle <- map["secondListTitle"]
        description <- map["description"]
        catalogueSecondListImageUrl <- map["catalogueSecondListImageUrl"]
        catalogueThirdList <- map["catalogueThirdList"]
    }
}

class CatalogueThirdList: Mappable, Decodable {
    
    var thirdListTitle: String?
    var photo: [String]?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        thirdListTitle <- map["thirdListTitle"]
        photo <- map["photo"]
    }
}
