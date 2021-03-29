//
//  MarkTableViewController.swift
//  MyPump
//
//  Created by Александр Майко on 06.01.2021.
//

import UIKit
import ObjectMapper
import FirebaseDatabase
import FirebaseStorage

class MainViewController: UITableViewController {
    var selectedSecondCataloguePartsList = [SecondCataloguePartsList]()
    var dawnloadedCatalogueParts = [CatalogueParts]()
    
    func getNextVC(){
        let vc = SecondTableViewController()
        vc.downloadedSecondCataloguePartsList  = selectedSecondCataloguePartsList
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.FirstLaunchFetchData { [weak self] (data) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.dawnloadedCatalogueParts = data
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
        //как вынести код выше в другой(соответствующий класс или extension)
    }
    
    func configureNavigationController() {
        self.navigationController?.addCustomBottomLine(color: AppColors.detailsColor, height: 3)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dawnloadedCatalogueParts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataForCell = dawnloadedCatalogueParts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MainTableViewCell
        cell.configureCell(data: dataForCell)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard dawnloadedCatalogueParts[indexPath.row].secondCataloguePartsList != nil else {return}
        self.selectedSecondCataloguePartsList = dawnloadedCatalogueParts[indexPath.row].secondCataloguePartsList!
        performSegue(withIdentifier: "getSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? SecondTableViewController        else { return }
        
        switch segue.identifier {
        
        case "getSecondVC":
            secondVC.downloadedSecondCataloguePartsList = selectedSecondCataloguePartsList
            
        default:
            break
        }
    }
}

