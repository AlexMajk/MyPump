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
    }
    
    var tableSections: [SectionType] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSections = [.photo, .moreInformation, .pumpsModelList]
        
        tableView.register(UINib(nibName: "MarkImageTableViewCell", bundle: nil), forCellReuseIdentifier: "MarkImageTableViewCell")
        tableView.register(UINib(nibName: "ReadMoreTableViewCell", bundle: nil), forCellReuseIdentifier: "ReadMoreTableViewCell")
        tableView.register(UINib(nibName: "ModelsPupmTableViewCell", bundle: nil), forCellReuseIdentifier: "ModelsPupmTableViewCell")
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
            return 7
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
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
