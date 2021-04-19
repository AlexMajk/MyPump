//
//  ModelTableViewController.swift
//  MyPump
//
//  Created by Александр Майко on 13.01.2021.
//

import UIKit

class SecondTableViewController: UITableViewController {
    var downloadedSecondCataloguePartsList = [SecondCataloguePartsList]()
    var selectedThirdCataloguePartsList = [ThirdCataloguePartsList]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    func showThirdVC() {
        let storybord = UIStoryboard(name: "MainViewController", bundle: nil)
//        let vc = SecondTableViewController()
        let vc = storybord.instantiateViewController(identifier: "thirdVC") as! ThirdTableViewController
        vc.downloadedThirdCataloguePartsList = selectedThirdCataloguePartsList
        navigationController?.pushViewController(vc, animated: true)
    }

    private func configureNavigationController() {
        let backButton = UIBarButtonItem()
        backButton.title = "назад"
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
        return downloadedSecondCataloguePartsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataForSecondVewCell = downloadedSecondCataloguePartsList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! SecondTableViewCell
        cell.configureCell(data: dataForSecondVewCell)
        //        cell.secondCellNameLabel.text = downloadedCatalogueSecondList[indexPath.row].secondListTitle
        //        cell.secondCellDescriptionLabel.text = downloadedCatalogueSecondList[indexPath.row].description
        //        cell.modelNameLabel.text = modelsDownloaded[indexPath.row].name
        //        cell.modelNameLabel.textColor = .white
        //        cell.modelDescriptionLabel.text = modelsDownloaded[indexPath.row].description

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = downloadedSecondCataloguePartsList[indexPath.row]
        selectedThirdCataloguePartsList = selectedItem.thirdCataloguePartsList!
        // performSegue(withIdentifier: "getParts", sender: self)
        showThirdVC()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let thirdVC = segue.destination as? ThirdTableViewController        else { return }

        switch segue.identifier {
        case "getParts":
            thirdVC.downloadedThirdCataloguePartsList = selectedThirdCataloguePartsList

        default:
            break
        }
    }
}
