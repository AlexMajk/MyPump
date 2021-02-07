//
//  MarkTableViewController.swift
//  MyPump
//
//  Created by Александр Майко on 06.01.2021.
//

import UIKit
import ObjectMapper
import FirebaseDatabase
import FirebaseStorage

class MarkTableViewController: UITableViewController {
    var jsonFromFirebase = [Main]()
    var downloadedMarkList = [MarkList]()
    var selectedMark = [ModelList]()
    let url = "https://mypump-c4d75-default-rtdb.firebaseio.com/.json"
    
    
    override func viewDidLoad() {
        NetworkManager.FetchData(url: url) { [weak self] (data) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.jsonFromFirebase = data
                self.downloadedMarkList = data[0].markList!
                self.tableView.reloadData()
            }
        }
        super.viewDidLoad()
        configureTableView()
        
    }
    
    func configureTableView() {
        self.title = "MyPump" //??????? этот параметр действует и на tabBarItem, игнорируя его данные
        self.tabBarItem.title = "Каталог"
        self.tableView.separatorStyle = .none
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return downloadedMarkList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MarkTableViewCell
        let arrayOfMarks = downloadedMarkList[indexPath.row]
        cell.markNameLabel.text = arrayOfMarks.name
        cell.markImage.image = UIImage(named: "\(arrayOfMarks.name!)")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let selectedRow = marksDownloaded[indexPath.row]
        self.selectedMark = downloadedMarkList[indexPath.row].modelList!
        print("Hey,\(downloadedMarkList[indexPath.row].name!)!!!")
        performSegue(withIdentifier: "getModels", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Выберите марку:"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let modelsVC = segue.destination as? ModelTableViewController        else { return }
        
        switch segue.identifier {
        
        case "getModels":
            modelsVC.modelsDownloaded = selectedMark
            
        default:
            break
        }
    }
}
