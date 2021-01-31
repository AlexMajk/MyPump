//
//  firestoreTableViewController.swift
//  MyPump
//
//  Created by Александр Майко on 24.01.2021.
//

import UIKit
import FirebaseFirestore


// здесь альтернативный вариант исользования firestore.Каждая марка содержит свойство Ref, которое используется как ссылка, по которой происходит дальнейшее перемещение вглубь каталога
class firestoreTableViewController: UITableViewController {
    var partOfKey = ""
    let db = Firestore.firestore()
    let markRef = Firestore.firestore().collection("marks")
    var mark = [MarkModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func fetchDataWithFirestore() {
        markRef.getDocuments { (querySnapshot, error) in
            if let err = error {
                print(err)
            } else {
                guard let snapshot = querySnapshot else {return}
                for document in snapshot.documents {
                    let data = document.data()
                    let markName = data["markName"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let refModels = data["refModels"] as? String ?? ""
                    let newMark = MarkModel(markName: markName, description: description, refModels: refModels)
                    self.mark.append(newMark)
                    
                }
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let modelsRef = db.collection("\(mark[indexPath.row].refModels)")
        //        modelsRef.getDocuments { (querySnapshot, error) in
        //            if let err = error {
        //                print(err)
        //            } else {
        //                guard let snapshot = querySnapshot else {return}
        //                for document in snapshot.documents {
        //                    let data = document.data()
        //                    let markName = data["name"] as? String ?? ""
        //                    let someData = data["Units"] as! [String:[String]]
        //                    for (key, value) in someData {
        //                        let unitName = key
        //                        let unitValue = value
        //                        let unit = UnitList(unit: unitName, unitValue: unitValue)
        //                        print(unit.unit)
        //                        print(unit.unitValue)
        //                    }
        //                    print(markName)
        //
        //                }
        //            }
        //        }
        //        performSegue(withIdentifier: "getModels", sender: self)
    }

    struct MarkModel {
        var markName = ""
        var description = ""
        var refModels = ""
    }
    
    struct ModelList {
        var name: String
    }
    
    struct UnitList {
        var unit = String()
        var unitValue = [String]()
        
    }
    

}
