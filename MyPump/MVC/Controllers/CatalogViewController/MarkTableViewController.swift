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
    var marksDownloaded: Model?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MyPump" //??????? этот параметр действует и на tabBarItem, игнорируя его данные
        self.tabBarItem.title = "Каталог"
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .white
        NetworkManager.FetchModels { (models) in
            DispatchQueue.main.async {
                self.marksDownloaded = models
                self.tableView.reloadData()
            }
        }

    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return marksDownloaded?.marks?.count ?? 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MarkTableViewCell
        let modelNameString = marksDownloaded?.marks?[indexPath.row] ?? ""
        cell.markNameLabel.text = modelNameString
        cell.markImage.image = UIImage(named:"\(modelNameString)")
        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(marksDownloaded?.marks?[indexPath.row] ?? "")
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return marksDownloaded?.headerTitle
    }
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        headerView.backgroundColor = UIColor.white
//        return headerView
//    }
//    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
    
}
