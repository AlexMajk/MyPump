//
//  MarkTableViewController.swift
//  MyPump
//
//  Created by Александр Майко on 06.01.2021.
//

import FirebaseDatabase
import FirebaseStorage
import ObjectMapper
import UIKit

class MainViewController: UITableViewController {
    var selectedSecondCataloguePartsList = [SecondCataloguePartsList]()
    var downloadedCatalogueParts = [CatalogueParts]()

    func showSecondVC() {
        let storybord = UIStoryboard(name: "MainViewController", bundle: nil)
//        let vc = SecondTableViewController()
        let vc = storybord.instantiateViewController(identifier: "secondVC") as! SecondTableViewController
        vc.downloadedSecondCataloguePartsList = selectedSecondCataloguePartsList
        navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkManager.FirstLaunchCataloguePartsFetchData { [weak self] data in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.downloadedCatalogueParts = data
                self.tableView.reloadData()
            }
        }

        configureTableView()
        configureNavigationController()
        configureTabBar()
    }

    func configureTableView() {
        self.navigationItem.title = "MyPump"
        self.tabBarItem.title = "Каталог"
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
    }

    func configureTabBar() {
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 3))
        lineView.backgroundColor = AppColors.detailsColor
        self.tabBarController?.tabBar.addSubview(lineView)
        // как вынести код выше в другой(соответствующий класс или extension)
    }

    func configureNavigationController() {
        self.navigationController?.addCustomBottomLine(color: AppColors.detailsColor, height: 3)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        downloadedCatalogueParts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataForCell = downloadedCatalogueParts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MainTableViewCell
        cell.configureCell(data: dataForCell)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard downloadedCatalogueParts[indexPath.row].secondCataloguePartsList != nil else { return }
        selectedSecondCataloguePartsList = downloadedCatalogueParts[indexPath.row].secondCataloguePartsList!
        showSecondVC()
        // performSegue(withIdentifier: "getSecondVC", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? SecondTableViewController else { return }

        switch segue.identifier {
        case "getSecondVC":
            secondVC.downloadedSecondCataloguePartsList = selectedSecondCataloguePartsList

        default:
            break
        }
    }
}
