//
//  PumpsModel.swift
//  MyPump
//
//  Created by Александр Майко on 05.01.2021.
//

import Foundation
import ObjectMapper


// MARK: - Main
//class MainCataloguePartsModel: Mappable, Decodable {
//
//    var catalogueParts: [CatalogueParts]?
//
//
//    required init?(map: Map) {
//    }
//
//    func mapping(map: Map) {
//        catalogueParts <- map["CatalogueParts"]
//    }
//
//}

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
    var secondCataloguePartsListImageUrl: String?
    var thirdCataloguePartsList: [ThirdCataloguePartsList]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        secondCataloguePartsListName <- map["secondCataloguePartsListName"]
        secondCataloguePartsListDescription <- map["secondCataloguePartsListDescription"]
        secondCataloguePartsListImageUrl <- map["secondCataloguePartsListImageUrl"]
        thirdCataloguePartsList <- map["thirdCataloguePartsList"]
    }
    
}

// MARK: - ThirdCataloguePartsList
class ThirdCataloguePartsList: Mappable, Decodable {
    
    var thirdCataloguePartsListImageUrl: String?
    var thirdCataloguePartsListName: String?
    var objectFromPartsCatalogueList: [ObjectFromPartsCatalogueList]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        thirdCataloguePartsListImageUrl <- map["thirdCataloguePartsListImageUrl"]
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
    var objectFromPartsCatalogueListUrlImage: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        objectFromPartsCatalogueListName <- map["objectFromPartsCatalogueListName"]
        objectFromPartsCatalogueListDescription <- map["objectFromPartsCatalogueListDescription"]
        objectFromPartsCatalogueListCode <- map["objectFromPartsCatalogueListCode"]
        objectFromPartsCatalogueListOEMCode <- map["objectFromPartsCatalogueListOEMCode"]
        objectFromPartsCatalogueListUrlImage <- map["objectFromPartsCatalogueListUrlImage"]
    }

}




