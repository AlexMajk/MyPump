//
//  NetworkManager.swift
//  MyPump
//
//  Created by Александр Майко on 06.01.2021.
//

import Foundation
import Firebase
import ObjectMapper
class NetworkManager {
    
    static func FetchMarks(completion : @escaping(_ array:[String])->(Void)) {
        let ref = Database.database().reference()
        ref.child("Marks").observeSingleEvent(of: .value) { (snapshot) in
            var key:[String] = []
            for child in snapshot.children {
                let data = child as! DataSnapshot
                key.append(data.key)
            }
            completion(key)
            //            guard let data = snapshot.value  else {return}
            //            if let data = data as? [String:Any] {
            //                if let marksJSON = Mapper<Mark>().map(JSONObject: data) {
            //                    print(marksJSON.headerTitle ?? "")
            //                    completion(marksJSON)
            //                }
            //            }
        }
    }
    static func FetchModels(ref:DatabaseReference,completion : @escaping(_ array:[String])->(Void)) {

        ref.observeSingleEvent(of: .value) { (snapshot) in
            var key:[String] = []
            for child in snapshot.children {
                let data = child as! DataSnapshot
                key.append(data.key)
            }
            completion(key)
            //            guard let data = snapshot.value  else {return}
            //            if let data = data as? [String:Any] {
            //                if let marksJSON = Mapper<Mark>().map(JSONObject: data) {
            //                    print(marksJSON.headerTitle ?? "")
            //                    completion(marksJSON)
            //                }
            //            }
        }
    }
    
    static func FetchBrinkmanModelsTest(completion : @escaping(_ photoOfUnit:Model)->(Void)) {
        let ref = Database.database().reference()
        ref.child("Model").observeSingleEvent(of: .value) { (snapshot) in
            guard let data = snapshot.value  else {return}
            if let data = data as? [String:Any] {
                if let modelJSON = Mapper<Model>().map(JSONObject: data) {
                    print(modelJSON.headerTitle ?? "")
                    completion(modelJSON)
                }
            }
        }
    }
}
