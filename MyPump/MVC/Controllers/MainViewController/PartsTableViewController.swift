//
//  PartsTableViewController.swift
//  MyPump
//
//  Created by Александр Майко on 29.01.2021.
//

import UIKit

class PartsTableViewController: UITableViewController {

    var downloadedParts = [PartList]()
    var selectedPartsUrls = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    
    private func configureNavigationController() {
        let backButton = UIBarButtonItem()
        backButton.title = "к выбору модели"
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
        return downloadedParts.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath)
        cell.textLabel?.text = downloadedParts[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedPartsUrls = downloadedParts[indexPath.row].photo!
        performSegue(withIdentifier: "getImagesVC", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imagesVC = segue.destination as? ImagesCollectionVC
        else { return }
        
        switch segue.identifier {
        
        case "getImagesVC":
            imagesVC.partListImageRef = selectedPartsUrls
            
        default:
            break
        }
    }
}
