//
//  OrderViewController.swift
//  MyPump
//
//  Created by Александр Майко on 07.03.2021.
//

import UIKit

class OrderViewController: UIViewController {
    
    var selectedObject: ObjectFromPartsCatalogueList?
    
    @IBOutlet weak var OrderTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OrderTableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
        configureNavigationController()
    }
    private func configureNavigationController() {
        let backButton = UIBarButtonItem()
        backButton.title = "назад"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UINib(nibName: "HeaderView",
                               bundle: .main).instantiate(withOwner: nil, options: nil).first as! HeaderView
        headerView.dataForHeaderCollectionViewCell = selectedObject
        headerView.configureView()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let headerView = UINib(nibName: "FooterView",
                               bundle: .main).instantiate(withOwner: nil, options: nil).first as! FooterView
        //        headerView.configureView()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.size.height / 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
