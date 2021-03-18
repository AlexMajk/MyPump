//
//  WatchListViewController.swift
//  MyPump
//
//  Created by пользователь on 3/19/21.
//

import UIKit

class WatchListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var watchList: [ProductModel] = []
    
    private let manager = ShopManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        watchList = manager.getWatchList()
        tableView.register(UINib(nibName: String(describing: ProductTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ProductTableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    convenience init (name: String) {
        self.init()
    }
    
}

extension WatchListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return watchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductTableViewCell.self), for: indexPath) as! ProductTableViewCell
        cell.configure(data: watchList[indexPath.row], isHiddenAddButton: true)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
