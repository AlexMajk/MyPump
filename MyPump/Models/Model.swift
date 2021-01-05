//
//  ArrayOfPumps.swift
//  MyPump
//
//  Created by Александр Майко on 04.01.2021.
//

import Foundation
import Firebase

//struct PumpMark: Codable {
//    var markName: String?
//    var models: [PumpModel]?
//
//    init(Data:[String:AnyObject]){
//        let markName = Data["Marks"] as? String
//        let models: [PumpModel]
//    }
//
////    init(Data:[String:AnyObject]) {
////        let mark = Data["Mark"] as! String
////        let model = Data["Model"] as! String
////        self.mark = mark
////        self.model = model
//
//    }
//struct PumpModel: Codable {
//    var modelName: String?
//    var units: [Units]?
//
//}
//
//struct Units: Codable {
//    var unitName:String?
//    var unitPhoto:[String]?
//}
// !!!!!!!!!!!!!!!!!!!


//
struct Marks: Codable {
    let models: [Models]?
    let name: String?

    init?(snapshot: DataSnapshot){
        guard
              let value = snapshot.value as? [String: AnyObject],
              let name = value["name"] as? String,
              let models = value["Models"] as? [Models] else {
              return nil
            }
        self.models = models
        self.name = name
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case models = "Models"
    }
}
// MARK: - Models
struct Models: Codable {
    let name: String?
    let units: [Units]?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case units = "Units"
    }
}
// MARK: - Units
struct Units: Codable {
    let unit: [Unit]?

    enum CodingKeys: String, CodingKey {
        case unit = "Unit"
    }
}
// MARK: - Unit
struct Unit: Codable {
    let name: String?
    let photo: [Photo]?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case photo = "Photo"
    }
}
// MARK: - Photo
struct Photo: Codable {
    let photo: [String]?

    enum CodingKeys: String, CodingKey {
        case photo = "photo"
    }
}



//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//struct GroceryItem {
//
//  let ref: DatabaseReference?
//  let key: String
//  let name: String
//  let addedByUser: String
//  var completed: Bool
//
//  init(name: String, addedByUser: String, completed: Bool, key: String = "") {
//    self.ref = nil
//    self.key = key
//    self.name = name
//    self.addedByUser = addedByUser
//    self.completed = completed
//  }
//
//  init?(snapshot: DataSnapshot) {
//    guard
//      let value = snapshot.value as? [String: AnyObject],
//      let name = value["name"] as? String,
//      let addedByUser = value["addedByUser"] as? String,
//      let completed = value["completed"] as? Bool else {
//      return nil
//    }
//
//    self.ref = snapshot.ref
//    self.key = snapshot.key
//    self.name = name
//    self.addedByUser = addedByUser
//    self.completed = completed
//  }
//}
