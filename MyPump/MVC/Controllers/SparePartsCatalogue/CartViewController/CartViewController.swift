//
//  ShoppingBagViewController.swift
//  MyPump
//
//  Created by Александр Майко on 20.03.2021.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var watchList: [ObjectFromPartsCatalogueList] = []
    
    private let manager = ShopManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        watchList = manager.getWatchList()
        tableView.register(UINib(nibName: String(describing: CartTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CartTableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    convenience init (name: String) {
        self.init()
    }
    
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return watchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CartTableViewCell.self), for: indexPath) as! CartTableViewCell
        cell.configure(data: watchList[indexPath.row])
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 40
//    }
}

