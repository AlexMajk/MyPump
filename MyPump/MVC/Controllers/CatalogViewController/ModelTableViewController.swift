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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    
    private func configureNavigationController() {
        let backButton = UIBarButtonItem()
//        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!]
        backButton.title = "к выбору марки"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! ModelTableViewCell
        cell.modelNameLabel.text = modelsDownloaded[indexPath.row].name
        cell.modelNameLabel.textColor = .white
        cell.modelDescriptionLabel.text = modelsDownloaded[indexPath.row].description
        
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
