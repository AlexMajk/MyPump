//
//  MarkPumpViewController.swift
//  MyPump
//
//  Created by пользователь on 3/12/21.
//

import UIKit

class MarkPumpViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
        
    private var timer: Timer?
    private var tableSections: [SectionType] = []
    private var isShowModels = false
    private var isShowAccessories = false
    private var count = 0
    private var markPumps: MarksPumps?
    
    convenience init(markPump: MarksPumps) {
        self.init()
        self.markPumps = markPump
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let screenType = markPumps?.screenType {
            tableSections = screenType.getSection()
        }
        setupUITableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 7.0, target: self, selector: #selector(targetTimer), userInfo: nil, repeats: true)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer?.invalidate()
        timer = nil
    }
    
    @objc func targetTimer() {
        count += 1
        tableView.reloadData()
    }
    
    private func setupUITableView() {
        
        tableView.register(UINib(nibName: String(describing: MarkImageTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MarkImageTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: ReadMoreTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ReadMoreTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: ModelsPupmTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ModelsPupmTableViewCell.self))
    }
}

extension MarkPumpViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        if let headerView = UINib(nibName: String(describing: ModelsListPumpsHeaderView.self), bundle: .main).instantiate(withOwner: nil, options: nil).first as? ModelsListPumpsHeaderView {
            headerView.delegate = self
            switch sectionType {
            case .photo, .description, .moreInformation, .otherInformation:
                return nil
            case .pumpsModelList:
                headerView.setTitleLabel(title: "Модельный ряд", isShowCell: isShowModels)
                headerView.setSectionInTableView(section: section)
                return headerView
            case .accessoriesPumps:
                headerView.setTitleLabel(title: "Запчасти / комплектующие", isShowCell: isShowAccessories)
                headerView.setSectionInTableView(section: section)
                return headerView
            }
        }
        return nil
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
        var returnedCell = UITableViewCell()
        switch sectionType {
        case .photo:
            if let cell = tableView.dequeueReusableCell(withIdentifier:String(describing: MarkImageTableViewCell.self), for: indexPath) as? MarkImageTableViewCell {
                cell.configure(number: count)
                returnedCell = cell
            }
        case .moreInformation:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ReadMoreTableViewCell.self), for: indexPath) as? ReadMoreTableViewCell {
                return cell
            }
        case .description:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ReadMoreTableViewCell.self), for: indexPath) as? ReadMoreTableViewCell{
                returnedCell = cell
            }
        case .otherInformation:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ReadMoreTableViewCell.self), for: indexPath) as? ReadMoreTableViewCell {
                returnedCell = cell
            }
        case .pumpsModelList:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ModelsPupmTableViewCell.self), for: indexPath) as? ModelsPupmTableViewCell {
                returnedCell = cell
            }
        case .accessoriesPumps:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ModelsPupmTableViewCell.self), for: indexPath) as? ModelsPupmTableViewCell {
                returnedCell = cell
            }
        }
        return returnedCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewController = PumpsDetailViewController(name: "")
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension MarkPumpViewController: ModelsListPumpsHeaderViewDelegate {
    func hiddenButtonPressed(section: Int) {
        
        let sectionType = tableSections[section]
        switch sectionType {
        case.accessoriesPumps:
            isShowAccessories = !isShowAccessories
        case .pumpsModelList:
            isShowModels = !isShowModels
        default:
            break
        }
        tableView.reloadSections(IndexSet(integer: section), with: .automatic)
    }
}
