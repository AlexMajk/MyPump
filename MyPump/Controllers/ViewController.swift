//
//  ViewController.swift
//  MyPump
//
//  Created by Александр Майко on 03.01.2021.
//

import UIKit
import ObjectMapper
import FirebaseDatabase

class ViewController: UIViewController {
    var arrayOfModels:[String] = []
    var arrayOfUnits:[String] = []
    override func viewDidLoad() {
        
        super.viewDidLoad()
        var ref = Database.database().reference()
        ref.child("Marks/Brinkmann/Models/450b/Units/Compressor/photo").observeSingleEvent(of: .value) { (snapshot) in
            guard let data = snapshot.value  else {return}
            
//            guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) else {return}
//            let transactions = Mapper<Pumps>().map(JSONObject: jsonData)
//
//           let url = Mapper<Pumps>(context: context).map(JSONString)
//
//            guard let data = notificationString.data(using: .utf8) else { return nil }
            do {
                if let jsonDictionary = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? Dictionary<String,Any> {
                    guard let notification = NotificationModel(JSON: jsonDictionary) else { return nil }
                    let userInfo = ["notification": notification]
                    switch notification.type! {
                    case .onfidoSuccess:
                        updateUserStatus()
                        NotificationCenter.default.post(name: ConstantNotifications.notificationReceived, object: nil, userInfo: userInfo)
                    default:
                        NotificationCenter.default.post(name: ConstantNotifications.notificationReceived, object: nil, userInfo: userInfo)
                    }
                    return notification
                }
            } catch let error as NSError {
                print(error)
            }
            return nil
            
            
            
        }
        
    }
}
