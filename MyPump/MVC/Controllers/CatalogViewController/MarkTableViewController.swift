//
//  MarkTableViewController.swift
//  MyPump
//
//  Created by Александр Майко on 06.01.2021.
//

import UIKit
import ObjectMapper
import FirebaseDatabase

class MarkTableViewController: UITableViewController {
    var marksDownloaded:[String] = []
    
    override func viewDidLoad() {
        configureTableView()
        super.viewDidLoad()
        NetworkManager.FetchMarks { (marks) in
            DispatchQueue.main.async {
                self.marksDownloaded = marks
                self.tableView.reloadData()
            }
        }
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
        return marksDownloaded.count 
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MarkTableViewCell
        let markNameString = marksDownloaded
        cell.markNameLabel.text = markNameString[indexPath.row]
        cell.markImage.image = UIImage(named:"\(markNameString[indexPath.row])")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = marksDownloaded[indexPath.row]
        performSegue(withIdentifier: "get\(selectedRow)Models", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Выберите марку:"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let modelsVC = segue.destination as? ModelTableViewController        else { return }
        
        switch segue.identifier {
        
        case "getBrinkmannModels":
            modelsVC.getBrinkmannModels()
            
        case "getPutzmeisterModels":
            modelsVC.getPutzmeristerModels()
            
        default:
            break
        }
    }
}

