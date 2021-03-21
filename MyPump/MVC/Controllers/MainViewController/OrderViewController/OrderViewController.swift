//
//  OrderViewController.swift
//  MyPump
//
//  Created by Александр Майко on 07.03.2021.
//

import UIKit

class OrderViewController: UIViewController {

    
    var selectedObject: ObjectFromPartsCatalogueList?
    
    @IBOutlet weak var OrderTableView: UITableView!
    
    @IBAction func addToShoppingBagButton(_ sender: UIBarButtonItem) {
        ShopManager.addWatchList(selectedObject!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OrderTableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
        configureNavigationController()
    }
    private func configureNavigationController() {
        let backButton = UIBarButtonItem()
        backButton.title = "назад"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UINib(nibName: "HeaderView",
                               bundle: .main).instantiate(withOwner: nil, options: nil).first as! HeaderView
        headerView.dataForHeaderCollectionViewCell = selectedObject
        headerView.configureView()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let headerView = UINib(nibName: "FooterView",
                               bundle: .main).instantiate(withOwner: nil, options: nil).first as! FooterView
        //        headerView.configureView()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.size.height / 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}




//class SpareViewController: UIViewController {
//
//
//    @IBOutlet weak var tableView: UITableView!
//
//    let shopManager = ShopManager.shared
//
//    let spareList: [ObjectFromPartsCatalogueList] = []
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.register(UINib(nibName: String(describing: ProductTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ProductTableViewCell.self))
//        tableView.delegate = self
//        tableView.dataSource = self
//    }
//
//    private func addProductToWatchList(selectedProduct: ObjectFromPartsCatalogueList) {
//        showAlertWithConfirmationInformation(product: selectedProduct)
//    }
//
//    private func showAlertWithConfirmationInformation(product: ObjectFromPartsCatalogueList) {
//        let alert = UIAlertController(title: "Вы хотите добавить выбранный товар в корзину?", message: nil, preferredStyle: .alert)
//        let okButton = UIAlertAction(title: "Да", style: .default) { (_) in
//            self.shopManager.addWatchList(product: product)
//        }
//        let noButton = UIAlertAction(title: "Нет", style: .cancel)
//
//        alert.addAction(okButton)
//        alert.addAction(noButton)
//        present(alert, animated: true, completion: nil)
//    }
//
//
////    convenience init(spare: SpareModel) {
////        self.init()
////    }
//}
//
//extension SpareViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return spareList.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductTableViewCell.self), for: indexPath) as! ProductTableViewCell
//        cell.configure(data: spareList[indexPath.row], isHiddenAddButton: false)
//        cell.delegate = self
//        return cell
//    }
//
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 40
//    }
//}
//
//extension SpareViewController: ProductTableViewCellDelegate {
//    func addPressButton(selectedProduct: ProductModel) {
//        addProductToWatchList(selectedProduct: selectedProduct)
//    }
//}
