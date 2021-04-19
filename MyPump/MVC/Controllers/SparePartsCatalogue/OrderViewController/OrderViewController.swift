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
    var imageSelectedToShowInDetailVC: UIImage?
    
    @IBOutlet weak var addToCartButtonOutlet: UIButton!
    
    @IBAction func addToCartButtonTapped(_ sender: UIButton) {
        showPreorderView(object: selectedObject!)
    }
    
    @IBOutlet weak var OrderTableView: UITableView!
    @IBAction func getCartViewController(_ sender: UIBarButtonItem) {
        showCartVC()
        //performSegue(withIdentifier: "getCartViewController", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OrderTableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
        self.viewModel = ViewModel(data: selectedObject!)
        configureNavigationController()
        configureButton()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        configureUITableViewHeader()
        //        configureUITableViewFooter()
    }
    
    private func configureUITableViewHeader() {
        let headerView  = UINib(nibName: "HeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! HeaderView
        headerView.delegate = self
        headerView.dataForHeaderCollectionViewCell = selectedObject
        headerView.configureView()
        headerView.frame = CGRect(x: 0, y: 0, width:self.view.bounds.width, height: self.view.frame.height/3)
        OrderTableView.tableHeaderView = headerView
    }
    
    func configureButton(){
        addToCartButtonOutlet.layer.cornerRadius = 10
        addToCartButtonOutlet.backgroundColor = AppColors.detailsColor
        addToCartButtonOutlet.layer.borderWidth = 2
        addToCartButtonOutlet.layer.borderColor = AppColors.mainThemeColor.cgColor
        addToCartButtonOutlet.setTitle("Добавить в корзину", for: .normal)
        addToCartButtonOutlet.titleLabel?.tintColor = AppColors.mainThemeColor
    }
    
    func showCartVC(){
        let storybord = UIStoryboard(name: "MainViewController", bundle: nil)
        let vc = storybord.instantiateViewController(identifier: "cartVC") as! CartViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showDetailVC(){
        let storybord = UIStoryboard(name: "MainViewController", bundle: nil)
        let vc = storybord.instantiateViewController(identifier: "detailVC") as! DetailImageViewController
        vc.imageWasSelectedToShowInDetailVC = imageSelectedToShowInDetailVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showPreorderView(object: ObjectFromPartsCatalogueList) {
        let object = shopManager.choosingSourceForObject(object: object)
        let preorderVC = ChildViewController(object: object)
        preorderVC.delegate = self
        preorderVC.modalTransitionStyle = .coverVertical
        preorderVC.modalPresentationStyle = .overFullScreen
        //navigationController?.pushViewController(preorderVC, animated: true) show not modal
        present(preorderVC, animated: false, completion: nil)
        
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
            detailVC.imageWasSelectedToShowInDetailVC = imageSelectedToShowInDetailVC
            
        default:
            break
        }
    }
    
}

extension OrderViewController: GetDetailVCDelegate {
    func getDetailVC(image: UIImage?) {
        self.imageSelectedToShowInDetailVC = image
        showDetailVC()
        //performSegue(withIdentifier: "getDetailVC", sender: self)
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

extension OrderViewController: ChildViewControllerDelegate{
    func showConfirmingAlert(){
        let alert = UIAlertController(title: "Добавлено", message:"в корзину", preferredStyle: .alert)
        
        present(alert, animated: true) {
            self.dismiss(animated: true, completion: nil)
        }
    }
} 

