//
//  SpareViewController.swift
//  MyPump
//
//  Created by пользователь on 3/18/21.
//

import UIKit



class SpareViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let shopManager = ShopManager.shared
    
    let spareList: [ProductModel] = [ProductModel(), ProductModel(),ProductModel(),ProductModel(),ProductModel(),ProductModel(),ProductModel(),ProductModel(),ProductModel(),ProductModel(),ProductModel(),ProductModel(),ProductModel(),ProductModel(),ProductModel()]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: ProductTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ProductTableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func addProductToWatchList(selectedProduct: ProductModel) {
        showAlertWithConfirmationInformation(product: selectedProduct)
    }
    
    private func showAlertWithConfirmationInformation(product: ProductModel) {
        let alert = UIAlertController(title: "Вы хотите добавить выбранный товар в корзину?", message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Да", style: .default) { (_) in
            self.shopManager.addWatchList(product: product)
        }
        let noButton = UIAlertAction(title: "Нет", style: .cancel)
        
        alert.addAction(okButton)
        alert.addAction(noButton)
        present(alert, animated: true, completion: nil)
    }
    

    convenience init(spare: SpareModel) {
        self.init()
    }
}

extension SpareViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spareList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductTableViewCell.self), for: indexPath) as! ProductTableViewCell
        cell.configure(data: spareList[indexPath.row], isHiddenAddButton: false)
        cell.delegate = self
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

extension SpareViewController: ProductTableViewCellDelegate {
    func addPressButton(selectedProduct: ProductModel) {
        addProductToWatchList(selectedProduct: selectedProduct)
    }
}
