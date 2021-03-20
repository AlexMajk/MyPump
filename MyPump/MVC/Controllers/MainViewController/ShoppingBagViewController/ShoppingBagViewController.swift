//
//  ShoppingBagViewController.swift
//  MyPump
//
//  Created by Александр Майко on 20.03.2021.
//

import UIKit

class ShoppingBagViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var watchList: [ObjectFromPartsCatalogueList] = []
    
    private let manager = ShopManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        watchList = manager.getWatchList()
        tableView.register(UINib(nibName: String(describing: ShoppingBagTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ShoppingBagTableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    convenience init (name: String) {
        self.init()
    }
    
}

extension ShoppingBagViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return watchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ShoppingBagTableViewCell.self), for: indexPath) as! ShoppingBagTableViewCell
//        cell.configure(data: watchList[indexPath.row], isHiddenAddButton: true)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 40
//    }
}

