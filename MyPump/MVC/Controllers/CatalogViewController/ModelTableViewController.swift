//
//  ModelTableViewController.swift
//  MyPump
//
//  Created by Александр Майко on 13.01.2021.
//

import UIKit

class ModelTableViewController: UITableViewController {
    var modelsDownloaded = [ModelList]()
    var partsDownloaded = [PartList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return modelsDownloaded.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
        cell.textLabel?.text = modelsDownloaded[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedModel = modelsDownloaded[indexPath.row]
        partsDownloaded = selectedModel.partList!
        performSegue(withIdentifier: "getParts", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let partsVC = segue.destination as? PartsTableViewController        else { return }
        
        switch segue.identifier {
        
        case "getParts":
            partsVC.downloadedParts = partsDownloaded
            
        default:
            break
        }
    }
    
}
