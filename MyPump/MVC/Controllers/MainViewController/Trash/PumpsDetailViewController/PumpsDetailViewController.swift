//
//  PumpsDetailViewController.swift
//  MyPump
//
//  Created by пользователь on 3/10/21.
//

import UIKit

class PumpsDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    convenience init (name: String) {
        self.init()
        title = "Марка Бетононасоса"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension PumpsDetailViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
