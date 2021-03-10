//
//  WatchViewController.swift
//  MyPump
//
//  Created by пользователь on 3/10/21.
//

import UIKit

class WatchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "WatchTableViewCell", bundle: nil), forCellReuseIdentifier: "WatchTableViewCell")

    }
}

extension WatchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UINib(nibName: "ModelsListPumpsHeaderView", bundle: .main).instantiate(withOwner: nil, options: nil).first as! ModelsListPumpsHeaderView
        headerView.setTitleLabel(title: "Запчасти / комплектующие")
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WatchTableViewCell", for: indexPath) as! WatchTableViewCell
        return cell
    }
    
    
}
