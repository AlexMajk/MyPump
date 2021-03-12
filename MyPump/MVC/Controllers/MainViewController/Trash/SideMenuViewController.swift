//
//  SideMenuViewController.swift
//  MyPump
//
//  Created by пользователь on 3/9/21.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    var menuList = ["продукция",
                    "запчасти",
                    "сервис и услуги",
                    "где купить",
                    "новости",
                    "О компании",
                    "контакты",
                    "Предложение об улучшении приложения"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        cell.textLabel?.text = menuList[indexPath.row]
        cell.textLabel?.textColor = .white
        return cell
    }
}
