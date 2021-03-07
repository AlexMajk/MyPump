//
//  ModelTableViewController.swift
//  MyPump
//
//  Created by Александр Майко on 13.01.2021.
//

import UIKit

class SecondTableViewController: UITableViewController {
    var downloadedCatalogueSecondList = [CatalogueSecondList]()
    var downloadedCatalogueThirdList = [CatalogueThirdList]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    
    private func configureNavigationController() {
        let backButton = UIBarButtonItem()
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
        return downloadedCatalogueSecondList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let arrayOfItems = downloadedCatalogueSecondList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! SecondTableViewCell
        cell.configureCell(data:arrayOfItems)
//        cell.secondCellNameLabel.text = downloadedCatalogueSecondList[indexPath.row].secondListTitle
//        cell.secondCellDescriptionLabel.text = downloadedCatalogueSecondList[indexPath.row].description
//        cell.modelNameLabel.text = modelsDownloaded[indexPath.row].name
//        cell.modelNameLabel.textColor = .white
//        cell.modelDescriptionLabel.text = modelsDownloaded[indexPath.row].description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedItem = downloadedCatalogueSecondList[indexPath.row]
        downloadedCatalogueThirdList = selectedItem.catalogueThirdList!
        performSegue(withIdentifier: "getParts", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let thirdVC = segue.destination as? PartsTableViewController        else { return }
        
        switch segue.identifier {
        
        case "getParts":
            thirdVC.downloadedItems = downloadedCatalogueThirdList
            
        default:
            break
        }
    }
    
}
