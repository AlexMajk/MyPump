//
//  MachineryCatalogueDataModel.swift
//  MyPump
//
//  Created by Александр Майко on 28.03.2021.
//

import Foundation
import ObjectMapper

class CatalogueMachinery: Codable, Mappable {
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        mainCatalogueMachineryName <- map["mainCatalogueMachineryName"]
        mainCatalogueMachineryDescription <- map["mainCatalogueMachineryDescription"]
        mainCatalogueMachineryImageURL <- map["mainCatalogueMachineryImageUrl"]
        secondCatalogueMachineryList <- map["secondCatalogueMachineryList"]
    }
    
    var mainCatalogueMachineryDescription, mainCatalogueMachineryImageURL, mainCatalogueMachineryName: String?
    var secondCatalogueMachineryList: [SecondCatalogueMachineryList]?


}

// MARK: - SecondCatalogueMachineryList
class SecondCatalogueMachineryList: Codable, Mappable {
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        secondCatalogueMachineryName <- map["secondCatalogueMachineryName"]
        secondCatalogueMachineryDescription <- map["secondCatalogueMachineryDescription"]
        secondCatalogueMachineryImageURL <- map["secondCatalogueMachineryImageUrl"]
        objectFromCatalogueMachinery <- map["objectFromCatalogueMachinery"]
    }
    
    var objectFromCatalogueMachinery: [ObjectFromCatalogueMachinery]?
    var secondCatalogueMachineryDescription, secondCatalogueMachineryImageURL, secondCatalogueMachineryName: String?

}

// MARK: - ObjectFromCatalogueMachinery
class ObjectFromCatalogueMachinery: Codable, Mappable {
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        objectFromCatalogueMachineryName <- map["objectFromCatalogueMachineryName"]
        objectFromCatalogueMachineryDescription <- map["objectFromCatalogueMachineryDescription"]
        objectFromCatalogueMachineryOEMCode <- map["objectFromCatalogueMachineryOEMCode"]
        objectFromCatalogueMachineryImageURL <- map["objectFromCatalogueMachineryImageUrl"]
    }
    
    var objectFromCatalogueMachineryDescription: String?
    var objectFromCatalogueMachineryImageURL: [String]?
    var objectFromCatalogueMachineryName, objectFromCatalogueMachineryOEMCode: String?


}
