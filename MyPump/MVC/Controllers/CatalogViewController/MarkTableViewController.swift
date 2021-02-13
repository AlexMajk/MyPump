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
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //self.tableView.separatorColor = UIColor.red
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
        self.navigationItem.title = "My pump"
        self.tabBarItem.title = "Каталог"
//        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor.lightGray
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
//        navigationController?.navigationBar.barTintColor = UIColor.gray
//        tabBarController?.tabBar.barTintColor = UIColor.gray
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

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
        //cell.backgroundColor = UIColor.clear
        let arrayOfMarks = downloadedMarkList[indexPath.row]
        cell.markNameLabel.text = arrayOfMarks.name
        cell.markNameLabel.textColor = .white
        cell.markDescriptionLabel.text = arrayOfMarks.description
        cell.markImage.image = UIImage(named: "\(arrayOfMarks.name!)")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let selectedRow = marksDownloaded[indexPath.row]
        self.selectedMark = downloadedMarkList[indexPath.row].modelList!
        print("Hey,\(downloadedMarkList[indexPath.row].name!)!!!")
        performSegue(withIdentifier: "getModels", sender: self)
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Выберите марку:"
//    }
    
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
