//
//  MarkPumpsViewController.swift
//  MyPump
//
//  Created by пользователь on 3/8/21.
//

import UIKit

class MarkPumpsViewController: UIViewController {
    
    enum SectionType {
        case photo
        case moreInformation
        case pumpsModelList
        case description
        case otherInformation
        case accessoriesPumps
    }
    
    private var timer: Timer?
    private var tableSections: [SectionType] = []
    private var isShowModels = true
    private var isShowAccessories = true
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSections = [.photo, .moreInformation, .pumpsModelList, .accessoriesPumps]
        tableView.register(UINib(nibName: "MarkImageTableViewCell", bundle: nil), forCellReuseIdentifier: "MarkImageTableViewCell")
        tableView.register(UINib(nibName: "ReadMoreTableViewCell", bundle: nil), forCellReuseIdentifier: "ReadMoreTableViewCell")
        tableView.register(UINib(nibName: "ModelsPupmTableViewCell", bundle: nil), forCellReuseIdentifier: "ModelsPupmTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(targetTimer), userInfo: nil, repeats: true)
        }
    }
    
    var count = 0
    @objc func targetTimer() {
        count += 1
        tableView.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer?.invalidate()
        timer = nil
    }
}

extension MarkPumpsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionType = tableSections[indexPath.section]
        switch sectionType {
        case .photo:
            return 200
        case .description:
            return 1
        case .moreInformation:
            return 20
        case .otherInformation:
            return 1
        case .pumpsModelList:
            return 60
        case .accessoriesPumps:
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = tableSections[section]
        switch sectionType {
        case .photo:
            return 1
        case .description:
            return 1
        case .moreInformation:
            return 1
        case .otherInformation:
            return 1
        case .pumpsModelList:
            return isShowModels ? 7 : 0
        case .accessoriesPumps:
            return isShowAccessories ? 10 : 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionType = tableSections[section]
        let headerView = UINib(nibName: "ModelsListPumpsHeaderView", bundle: .main).instantiate(withOwner: nil, options: nil).first as! ModelsListPumpsHeaderView
        headerView.delegate = self
        switch sectionType {
        case .photo, .description, .moreInformation, .otherInformation:
            return nil
        case .pumpsModelList:
            headerView.setTitleLabel(title: "Модельный ряд")
            headerView.setSectionInTableView(section: section)
            return headerView
        case .accessoriesPumps:
            headerView.setTitleLabel(title: "Запчасти / комплектующие")
            headerView.setSectionInTableView(section: section)
            return headerView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionType = tableSections[section]
        switch sectionType {
        case .photo, .description, .moreInformation, .otherInformation:
            return 0
        case .pumpsModelList, .accessoriesPumps:
            return 40
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableSections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = tableSections[indexPath.section]
        switch sectionType {
        case .photo:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MarkImageTableViewCell", for: indexPath) as! MarkImageTableViewCell
            cell.configure(number: count % 2)
            return cell
        case .moreInformation:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReadMoreTableViewCell", for: indexPath) as! ReadMoreTableViewCell
            return cell
        case .description:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReadMoreTableViewCell", for: indexPath) as! ReadMoreTableViewCell
            return cell
        case .otherInformation:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReadMoreTableViewCell", for: indexPath) as! ReadMoreTableViewCell
            return cell
        case .pumpsModelList:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ModelsPupmTableViewCell", for: indexPath) as! ModelsPupmTableViewCell
            return cell
        case .accessoriesPumps:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ModelsPupmTableViewCell", for: indexPath) as! ModelsPupmTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = PumpsDetailViewController(name: "")
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MarkPumpsViewController: ModelsListPumpsHeaderViewDelegate {
    func hiddenButtonPressed(section: Int) {
        if section == 2 {
            isShowModels = !isShowModels
            tableView.reloadSections(IndexSet(integer: section), with: .automatic)
        } else if section == 3 {
            isShowAccessories = !isShowAccessories
            tableView.reloadSections(IndexSet(integer: section), with: .automatic)
        }
    }
}
