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
        configureUITableView()
    }
    
    private func configureUITableView() {
        tableView.register(UINib(nibName: String(describing: WatchTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WatchTableViewCell.self))
    }
}

extension WatchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerView = UINib(nibName:  String(describing: ModelsListPumpsHeaderView.self), bundle: .main).instantiate(withOwner: nil, options: nil).first as? ModelsListPumpsHeaderView {
            headerView.setTitleLabel(title: "Запчасти / комплектующие", isShowCell: true)
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WatchTableViewCell.self), for: indexPath) as! WatchTableViewCell
        return cell
    }
}
