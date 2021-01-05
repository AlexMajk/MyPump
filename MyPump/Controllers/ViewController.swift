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
        //ref.child("0/name").setValue("Mike")// изменяем данные
        //ref.childByAutoId().setValue(["name":"Alex"])
        // Do any additional setup after loading the view.
        //        ref.observe(.childAdded, with: { snapshot in
        //
        //        })
        ref.child("Marks/").observeSingleEvent(of: .value) { [] (snapshot) in
            guard let data = snapshot.value  else {return}
            
            guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) else {return}
            let transactions = Mapper<Pumps>().map(JSONObject: jsonData)
            
          
            
              

//            do {
//                // make sure this JSON is in the format we expect
//
////                let data = string.data(using: .utf8)
//
//                if let downloadedJSON = try JSONDecoder().decode(Pumps.self, from: jsonData) {
//                    // try to read out a string array
//                    if let names = json["names"] as? [String] {
//                        print(names)
//                    }
//                }
//            } catch let error as NSError {
//                print("Failed to load: \(error.localizedDescription)")
//            }
            
            
            
            
            print(data)
            
            //if let value = data["Mark"] as? String {
//            let pumps = Pumps.init(Data: data)
//            print(pumps.mark)
//            self.arrayOfModels.append(pumps.mark)
//            self.arrayOfModels.append(pumps.model)
//            print(self.arrayOfModels.count)

            
        }
    }
}
//class FirebaseTest {
//
//    var items: [GroceryItem] = []
//
//    let ref = Database.database().reference(withPath: "grocery-items")
//
//func viewDidLoad() {
//    // 1
//    ref.observe(.value, with: { snapshot in
//      // 2
//      var newItems: [GroceryItem] = []
//
//      // 3
//      for child in snapshot.children {
//        // 4
//        if let snapshot = child as? DataSnapshot,
//           let groceryItem = GroceryItem(snapshot: snapshot) {
//          newItems.append(groceryItem)
//        }
//      }
//
//      // 5
//      self.items = newItems
//        print(self.items)
//      //self.tableView.reloadData()
//    })
//    }
//}
