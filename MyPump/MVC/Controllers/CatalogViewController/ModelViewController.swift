//
//  ModelViewController.swift
//  MyPump
//
//  Created by пользователь on 1/21/21.
//

import UIKit

class ModelViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var carModel: [ModelsCar] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ModelViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let car = carModel[indexPath.row]
        cell.textLabel?.text = "\(car.name ?? "") \(car.color ?? "") коробка передач: \(car.transmition ?? "" )"
        return cell
    }
}
