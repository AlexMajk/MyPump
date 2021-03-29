//
//  OrderViewController.swift
//  MyPump
//
//  Created by Александр Майко on 07.03.2021.
//

import UIKit

class OrderViewController: UIViewController{
    
    let shopManager = ShopManager.shared
    var selectedObject: ObjectFromPartsCatalogueList?
    var viewModel: ViewModel?
    var image: UIImage?
    
    @IBOutlet weak var OrderTableView: UITableView!
    @IBAction func getCartViewController(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "getCartViewController", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OrderTableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
        self.viewModel = ViewModel(data: selectedObject!)
        configureNavigationController()
        configureUITableViewHeader()
        configureUITableViewFooter()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
        
    private func configureUITableViewHeader() {
        let headerView  = UINib(nibName: "HeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! HeaderView
        headerView.delegate = self
        headerView.dataForHeaderCollectionViewCell = selectedObject
        headerView.configureView()
        headerView.frame = CGRect(x: 0, y: 0, width:self.view.bounds.width, height: self.view.frame.height/3)
        OrderTableView.tableHeaderView = headerView
    }
    
    private func configureUITableViewFooter(){
        let footerView = UINib(nibName: "FooterView",
                               bundle: .main).instantiate(withOwner: nil, options: nil).first as! FooterView
        footerView.delegate = self
        //footerView.frame = CGRect(x: 0, y: 0, width:self.view.bounds.width, height: 200)
        footerView.configure()
        OrderTableView.tableFooterView = footerView
        OrderTableView.tableFooterView?.frame.size.height = 100
        //OrderTableView.tableFooterView?.frame.size.height = 2000
//        OrderTableView.tableFooterView?.backgroundColor = .red
        
    }
    
    private func showAlertWithConfirmationInformation(object: ObjectFromPartsCatalogueList) {
            let alert = UIAlertController(title: "Вы хотите добавить выбранный товар в корзину?", message: nil, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Да", style: .default) { (_) in
                self.shopManager.addWatchList(object: object)
            }
            let noButton = UIAlertAction(title: "Нет", style: .cancel)
            
            alert.addAction(okButton)
            alert.addAction(noButton)
            present(alert, animated: true, completion: nil)
        }

    
    private func configureNavigationController() {
        let backButton = UIBarButtonItem()
        backButton.title = "назад"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailImageViewController
        else { return }

        switch segue.identifier {

        case "getDetailVC":
            detailVC.image = self.image


        default:
            break
        }
    }

}

extension OrderViewController:  ButtonDelegate {
    func addToCartTapped(sender: UIButton) {
        showAlertWithConfirmationInformation(object: selectedObject!)
    }
}

extension OrderViewController: GetDetailVCDelegate {
    func getDetailVC(image: UIImage?) {
        self.image = image
        performSegue(withIdentifier: "getDetailVC", sender: self)
    }
}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        if let count = viewModel?.items.count {
            return count
        } else {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel?.items[section].sectionTitle
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sectionType = viewModel!.items[indexPath.section].type
       switch sectionType {
       
       case .objectFromPartsCatalogueListName:
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
        cell.configure(data: (selectedObject?.objectFromPartsCatalogueListName)!)
        return cell
       
       case .objectFromPartsCatalogueListCode:
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
        cell.configure(data: (selectedObject?.objectFromPartsCatalogueListCode)!)
        return cell
        
       case .objectFromPartsCatalogueListDescription:
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
        cell.configure(data: (selectedObject?.objectFromPartsCatalogueListDescription)!)
        return cell
        
       case .objectFromPartsCatalogueListOEMCode:
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
        cell.configure(data: (selectedObject?.objectFromPartsCatalogueListOEMCode)!)
        return cell
       }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}


