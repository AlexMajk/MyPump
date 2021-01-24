//
//  MarkTableViewController.swift
//  MyPump
//
//  Created by Александр Майко on 06.01.2021.
//

import UIKit
import ObjectMapper
import FirebaseDatabase
class MarkTableViewController: UIViewController {
    var carsList: [CarModel] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getDatarequest()
    }
    
    func getDatarequest() {
        let url = URL(string: "https://english-97a48.firebaseio.com/.json")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            let carsList = Mapper<CarModel>().mapArray(JSONString: String(data: data, encoding: .utf8)!)
            guard let myCarsList = carsList else {return}
            self.carsList = myCarsList
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }

    func configureTableView() {
        self.title = "MyPump"
        self.tabBarItem.title = "Каталог"
        self.tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: String(describing: CatalogCarsTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CatalogCarsTableViewCell.self))
    }
    
    func showMarkViewController(car: CarModel) {
        let vc = UIStoryboard.init(name: "MarkTableViewController", bundle: Bundle.main).instantiateViewController(withIdentifier: "ModelViewController") as! ModelViewController
        vc.title = car.name
        vc.carModel = car.modelsList
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MarkTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CatalogCarsTableViewCell.self), for: indexPath) as! CatalogCarsTableViewCell
        cell.configure(title: carsList[indexPath.row].name, markImageUrlString: carsList[indexPath.row].photoURLString!)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.showMarkViewController(car: carsList[indexPath.row])
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Выберите марку:"
    }
}
