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
    var models: Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.FetchModels { (models) in
            DispatchQueue.main.async {
                self.models = models
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
        return models?.models?.count ?? 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        cell.textLabel?.text = models?.models?[indexPath.row] ?? "!!!!!!"
        cell.imageView?.image = UIImage(named:"Brinkmann")
        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hi")
    }
    
}
