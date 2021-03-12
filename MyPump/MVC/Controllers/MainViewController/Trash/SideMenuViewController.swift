//
//  SideMenuViewController.swift
//  MyPump
//
//  Created by пользователь on 3/9/21.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    var menuList = ["Продукция",
                    "Запчасти",
                    "Сервис и услуги",
                    "где купить",
                    "Новости",
                    "О компании",
                    "Контакты",
                    "Предложение об улучшении приложения"]
}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = menuList[indexPath.row]
        cell.textLabel?.textColor = .white
        return cell
    }
}
