//
//  TestVC.swift
//  MyPump
//
//  Created by Александр Майко on 19.01.2021.
//

import UIKit
import Firebase
import ObjectMapper

class TestVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var carsList = [Main1]()
    var mark = [MarkModel]()
    var partOfKey = ""
    let db = Firestore.firestore()
    let markRef = Firestore.firestore().collection("marks")
    
    @IBAction func saveButton(_ sender: UIButton) {


    }
    
    func getDatarequest() {
        let url = URL(string: "https://mypump-c4d75-default-rtdb.firebaseio.com/.json")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data.self else { return }
            print("OKKKKKK")
            let carsList1 = Mapper<Main1>().mapArray(JSONString: String(data: data, encoding: .utf8)!)
            guard carsList1 != nil else {return}

            DispatchQueue.main.async {
                self.carsList = carsList1!
                self.tableView.reloadData()
            }

        }
        task.resume()
    }
    
    
    @IBAction func fetchdataButton(_ sender: UIButton) {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDatarequest()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1")!
        let currentMark = carsList[indexPath.row]
        
        
        cell.textLabel?.text = "\(currentMark.markList![0].name!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modelsRef = db.collection("\(mark[indexPath.row].refModels)")
        modelsRef.getDocuments { (querySnapshot, error) in
            if let err = error {
                print(err)
            } else {
                guard let snapshot = querySnapshot else {return}
                for document in snapshot.documents {
                    let data = document.data()
                    let markName = data["name"] as? String ?? ""
                    let someData = data["Units"] as! [String:[String]]
                    for (key, value) in someData {
                        let unitName = key
                        let unitValue = value
                        let unit = UnitList(unit: unitName, unitValue: unitValue)
                        print(unit.unit)
                        print(unit.unitValue)
                    }
                    print(markName)
                    
                }
            }
        }
        performSegue(withIdentifier: "getModels", sender: self)
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
//func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    guard let modelsVC = segue.destination as? SecondTableViewController
//    else { return }
//
//    switch segue.identifier {
//
//    case "getModels":
//        modelsVC.getBrinkmannModels()
//
//
//    default:
//        break
//    }
//}
class Main1: Mappable {

    var markList: [MarkList1]?

    required init?(map: Map){
    }

    func mapping(map: Map) {
        markList <- map["markList"]
    }
}

class MarkList1: Mappable {

    var description: String?
    var modelList: [ModelList1]?
    var name: String?
    var photoLogo: String?

    required init?(map: Map){
    }

    func mapping(map: Map) {
        description <- map["description"]
        modelList <- map["modelList"]
        name <- map["name"]
        photoLogo <- map["photoLogo"]
    }
}

class ModelList1: Mappable {

    var description: String?
    var name: String?
    var partList: [PartList1]?
    var yearsOfRelease: String?

    required init?(map: Map){
    }

    func mapping(map: Map) {
        description <- map["description"]
        name <- map["name"]
        partList <- map["partList"]
        yearsOfRelease <- map["years of release"]
    }
}

class PartList1: Mappable {

    var name: String?
    var photo: [String]?

    required init?(map: Map){
    }

    func mapping(map: Map) {
        name <- map["name"]
        photo <- map["photo"]
    }
} 
