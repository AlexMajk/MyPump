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
    var main = [Main]()
    var markList = [MarkList]()
    let url = "https://mypump-c4d75-default-rtdb.firebaseio.com/.json"
    
    @IBAction func saveButton(_ sender: UIButton) {
    }
    
    func getDatarequest() {
        let url = URL(string: "https://mypump-c4d75-default-rtdb.firebaseio.com/.json")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data.self else { return }
            print("OKKKKKK")
            let carsList1 = Mapper<Main>().mapArray(JSONString: String(data: data, encoding: .utf8)!)
            guard carsList1 != nil else {return}
            
            DispatchQueue.main.async {
                self.main = carsList1!
                self.markList = self.main[0].markList!
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    @IBAction func fetchdataButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.FetchData(url: url) { (data) in
            DispatchQueue.main.async {
                self.main = data
                self.markList = self.main[0].markList!
                self.tableView.reloadData()
            }
        }
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return markList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1")!
        let currentMark = markList[indexPath.row]
        cell.textLabel?.text = "\(currentMark.name!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modelList = markList[indexPath.row].modelList
        for i in modelList! {
            print(i.name ?? "")
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

