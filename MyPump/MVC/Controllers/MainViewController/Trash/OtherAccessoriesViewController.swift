//
//  OtherAccessoriesViewController.swift
//  MyPump
//
//  Created by пользователь on 3/10/21.
//

import UIKit

class OtherAccessoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    enum SectionType {
        case hosesType
        case couplingType
    }
    
   private var tableSections: [SectionType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUITableView()
        tableSections = [.couplingType, .hosesType]
    }
    
    private func configureUITableView() {
        tableView.register(UINib(nibName: String(describing: ModelsPupmTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ModelsPupmTableViewCell.self))
    }
}

extension OtherAccessoriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionType = tableSections[section]
        if let headerView = UINib(nibName:  String(describing: ModelsListPumpsHeaderView.self), bundle: .main).instantiate(withOwner: nil, options: nil).first as? ModelsListPumpsHeaderView {
            switch sectionType{
            case .hosesType:
                headerView.setTitleLabel(title: "Шланги", isShowCell: true)
            case .couplingType:
                headerView.setTitleLabel(title: "Муфты", isShowCell: true)
            }
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = tableSections[section]
        switch sectionType {
        case .hosesType:
            return 7
        case .couplingType:
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ModelsPupmTableViewCell.self), for: indexPath) as! ModelsPupmTableViewCell
        return cell
    }
}
