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
    var downloadedMarkList = [MarkList]()
    var selectedMark = [ModelList]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.FirstLaunchFetchData() { [weak self] (data) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.downloadedMarkList = data[0].markList!
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
        //как вынести код выше в другой(соответствующий класс иил extension)
    }
    
    func configureNavigationController() {
        self.navigationController?.addCustomBottomLine(color: AppColors.detailsColor, height: 3)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return downloadedMarkList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let arrayOfMarks = downloadedMarkList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MarkTableViewCell
        cell.configureCell(data: arrayOfMarks)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard downloadedMarkList[indexPath.row].modelList != nil else {return}
        self.selectedMark = downloadedMarkList[indexPath.row].modelList!
        performSegue(withIdentifier: "getModels", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let modelsVC = segue.destination as? ModelTableViewController        else { return }
        
        switch segue.identifier {
        
        case "getModels":
            modelsVC.modelsDownloaded = selectedMark
            
        default:
            break
        }
    }
}

