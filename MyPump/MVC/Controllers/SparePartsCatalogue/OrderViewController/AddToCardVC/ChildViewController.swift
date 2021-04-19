//
//  ChildViewController.swift
//  MyPump
//
//  Created by Александр Майко on 02.04.2021.
//

import UIKit

protocol ChildViewControllerDelegate: class {
    func showConfirmingAlert()
}

class ChildViewController: UIViewController {
    
    @IBOutlet private weak var childVcView: UIView!
    @IBOutlet private weak var selectedObjectTitlelabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var stepperOutlet: UIStepper!
    @IBOutlet weak var orderButtonOutlet: UIButton!
    
    weak var delegate: ChildViewControllerDelegate?
    
    private var preparedToAddingObject: ObjectFromPartsCatalogueList?
    private var countOfPreparedItemToAddingInShoppingCart: Int = 1// устанавливаем дефолтное значение количества добавляемых единиц объекта в корзину
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedObjectTitlelabel.text = preparedToAddingObject?.objectFromPartsCatalogueListName
        stepperOutlet.value = Double(countOfPreparedItemToAddingInShoppingCart)
        countLabel.text = String(countOfPreparedItemToAddingInShoppingCart)
        configureChildVC()
        //configureOrderButton()
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        countOfPreparedItemToAddingInShoppingCart = Int(sender.value)//изменяем значение переменной, чтобы затем его использовать, в том числе для передачи в лэйбл
        countLabel.text = String(countOfPreparedItemToAddingInShoppingCart)
        orderButtonOutlet.isEnabled = countOfPreparedItemToAddingInShoppingCart > 0 ? true : false// если значение кол-ва выбраных единиц ниже 0 - кнопка перестает быть активной
    }
    
    @IBAction func closeChildVcButtonTapped(_ sender: UIButton) {
        configureClosingPreorderView(isShowAlert: false)
        
    }
    
    private func configureClosingPreorderView(isShowAlert: Bool) {
        UIView.animate(withDuration: 0.2) {// изменяем время "скрывания" модального контроллера
            self.view.backgroundColor = .clear // убираем затемнение фона
        } completion: { (_) in
            self.dismiss(animated: true, completion: {
                if isShowAlert {
                    self.delegate?.showConfirmingAlert()
                }
            })
        }
    }
    
    func configureChildVC(){
        childVcView.layer.cornerRadius = 10
        childVcView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        childVcView.layer.borderWidth = 2
        childVcView.layer.borderColor = AppColors.mainThemeColor.cgColor
        configureOrderButton()
    }
    func configureOrderButton(){
        orderButtonOutlet.layer.cornerRadius = 10//????????
        orderButtonOutlet.layer.borderWidth = 2
        orderButtonOutlet.clipsToBounds = true
        orderButtonOutlet.setBackgroundImage(AppColors.detailsColor.image(), for: .normal)
        orderButtonOutlet.layer.borderColor = AppColors.mainThemeColor.cgColor
        orderButtonOutlet.setBackgroundImage(UIColor.lightGray.image(), for: .disabled)
        orderButtonOutlet.setTitle("добавить", for: .normal)
    }
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        
        if let object = preparedToAddingObject {
            object.countOfCurrentObjectInShoppingCart = countOfPreparedItemToAddingInShoppingCart
            ShopManager.shared.addWatchList(object: object)
        }
        configureClosingPreorderView(isShowAlert: true)
    }
    
    
    convenience init (object: ObjectFromPartsCatalogueList) {
        self.init()
        preparedToAddingObject = object
        countOfPreparedItemToAddingInShoppingCart = object.countOfCurrentObjectInShoppingCart
        
    }
}


