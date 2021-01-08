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
    
    
    static func FetchModels(completion : @escaping(_ photoOfUnit:Model)->(Void)) {
        let ref = Database.database().reference()
        ref.child("Mark").observeSingleEvent(of: .value) { (snapshot) in
            guard let data = snapshot.value  else {return}
            if let data = data as? [String:Any] {
                if let marksJSON = Mapper<Model>().map(JSONObject: data) {
                    print(marksJSON.headerTitle ?? "")
                    completion(marksJSON)
//                    case .success(let value):
//                        var courses = [Course]()
//                        courses = Course.getArray(from: value)!
//                        completion(courses)
                }
                
            }
        }
    }
}
