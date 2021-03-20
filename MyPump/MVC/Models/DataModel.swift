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


// MARK: - Main
class Main1: Mappable, Decodable {
    
    var catalogueParts: [CatalogueParts]?
    
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        catalogueParts <- map["CatalogueParts"]
    }
    
}

// MARK: - CatalogueParts
class CatalogueParts: Mappable, Decodable {
    
    var mainCataloguePartsListName: String?
    var mainCataloguePartsListDescription: String?
    var mainCataloguePartsListImageUrl: String?
    var secondCataloguePartsList: [SecondCataloguePartsList]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        mainCataloguePartsListName <- map["mainCataloguePartsListName"]
        mainCataloguePartsListDescription <- map["mainCataloguePartsListDescription"]
        mainCataloguePartsListImageUrl <- map["mainCataloguePartsListImageUrl"]
        secondCataloguePartsList <- map["secondCataloguePartsList"]
    }

}

// MARK: - SecondCataloguePartsList
class SecondCataloguePartsList: Mappable, Decodable {
    
    var secondCataloguePartsListName: String?
    var secondCataloguePartsListDescription: String?
    var secondCataloguePartsListImageURL: String?
    var thirdCataloguePartsList: [ThirdCataloguePartsList]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        secondCataloguePartsListName <- map["secondCataloguePartsListName"]
        secondCataloguePartsListDescription <- map["secondCataloguePartsListDescription"]
        secondCataloguePartsListImageURL <- map["secondCataloguePartsListImageUrl"]
        thirdCataloguePartsList <- map["thirdCataloguePartsList"]
    }
    
}

// MARK: - ThirdCataloguePartsList
class ThirdCataloguePartsList: Mappable, Decodable {
    
    var thirdCataloguePartsListImageURL: String?
    var thirdCataloguePartsListName: String?
    var objectFromPartsCatalogueList: [ObjectFromPartsCatalogueList]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        thirdCataloguePartsListImageURL <- map["thirdCataloguePartsListImageUrl"]
        thirdCataloguePartsListName <- map["thirdCataloguePartsListName"]
        objectFromPartsCatalogueList <- map["objectFromPartsCatalogueList"]
    }
    

}

// MARK: - ObjectFromPartsCatalogueList
class ObjectFromPartsCatalogueList: Mappable, Decodable {
    
    var objectFromPartsCatalogueListName: String?
    var objectFromPartsCatalogueListDescription: String?
    var objectFromPartsCatalogueListCode: String?
    var objectFromPartsCatalogueListOEMCode: String?
    var objectFromPartsCatalogueListURLImage: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        objectFromPartsCatalogueListName <- map["objectFromPartsCatalogueListName"]
        objectFromPartsCatalogueListDescription <- map["objectFromPartsCatalogueListDescription"]
        objectFromPartsCatalogueListCode <- map["objectFromPartsCatalogueListCode"]
        objectFromPartsCatalogueListOEMCode <- map["objectFromPartsCatalogueListOEMCode"]
        objectFromPartsCatalogueListURLImage <- map["objectFromPartsCatalogueListUrlImage"]
    }

}




