//
//  PartsTableViewController.swift
//  MyPump
//
//  Created by Александр Майко on 29.01.2021.
//

import UIKit

class ThirdTableViewController: UITableViewController {
    
    var downloadedThirdCataloguePartsList = [ThirdCataloguePartsList]()
    var selectedObjectFromPartsCatalogueList = [ObjectFromPartsCatalogueList]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    
    private func configureNavigationController() {
        let backButton = UIBarButtonItem()
        backButton.title = "назад"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func showObjectVC(){
        let storybord = UIStoryboard(name: "MainViewController", bundle: nil)
//        let vc = SecondTableViewController()
        let vc = storybord.instantiateViewController(identifier: "objectVC") as! ObjectCollectionView
        vc.dawnloadedObjectFromPartsCatalogueList = selectedObjectFromPartsCatalogueList
        navigationController?.pushViewController(vc, animated: true)
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
        return downloadedThirdCataloguePartsList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as! ThirdTableViewCell
        cell.configureCell(data: downloadedThirdCataloguePartsList[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedObjectFromPartsCatalogueList = downloadedThirdCataloguePartsList[indexPath.row].objectFromPartsCatalogueList!
        showObjectVC()
        //performSegue(withIdentifier: "getImagesVC", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imagesVC = segue.destination as? ObjectCollectionView
        else { return }
        
        switch segue.identifier {
        
        case "getImagesVC":
            imagesVC.dawnloadedObjectFromPartsCatalogueList = selectedObjectFromPartsCatalogueList
            
        default:
            break
        }
    }
}
