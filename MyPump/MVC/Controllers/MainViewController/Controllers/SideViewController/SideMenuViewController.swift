//
//  SideMenuViewController.swift
//  MyPump
//
//  Created by пользователь on 3/9/21.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    convenience init(name: String) {
        self.init()
        
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: SideMenuTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SideMenuTableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    var menuList = ["Продукция",
                    "Запчасти",
                    "Сервис и услуги",
                    "где купить",
                    "Новости",
                    "О компании",
                    "Контакты",
                    "Ваши предложения"]
}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SideMenuTableViewCell.self), for: indexPath) as! SideMenuTableViewCell
        cell.configureCell(title: menuList[indexPath.row])
        return cell
    }
}
