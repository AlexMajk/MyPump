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
    
    var mark = [MarkModel]()
    var partOfKey = ""
    let db = Firestore.firestore()
    let markRef = Firestore.firestore().collection("marks")
    
    @IBAction func saveButton(_ sender: UIButton) {
        
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
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mark.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1")!
        let currentMark = mark[indexPath.row]
        cell.textLabel?.text = "\(currentMark.markName) \(currentMark.description)"
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
    
    
    public struct City: Codable {
        
        let name: String
        let state: String?
        let country: String?
        let isCapital: Bool?
        let population: Int64?
        
        enum CodingKeys: String, CodingKey {
            case name
            case state
            case country
            case isCapital = "capital"
            case population
        }
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
