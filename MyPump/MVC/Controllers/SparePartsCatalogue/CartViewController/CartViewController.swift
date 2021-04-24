//
//  ShoppingBagViewController.swift
//  MyPump
//
//  Created by Александр Майко on 20.03.2021.
//

import MessageUI
import UIKit

final class CartViewController: UIViewController, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {
    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendRequestButtonOutlet: UIButton!

    // MARK: - Public Properties

    var watchList: [ObjectFromPartsCatalogueList] = []
    var countOfItemsInShoppingCart: Int?
    var selectedObjectFromPartsCatalogueCartList: ObjectFromPartsCatalogueList?

    // MARK: - Private Properties
    private let shoppingManager = ShopManager.shared

    // MARK: - Initializers

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        watchList = shoppingManager.getWatchList()
        tableView.register(UINib(nibName: String(describing: CartTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CartTableViewCell.self))
        configureButton()
        configureNavigationController()
        tableView.delegate = self
        tableView.dataSource = self
        sendRequestButtonOutlet.isEnabled = watchList.isEmpty ? false : true// проверяем на наличие элементов в массиве, в противном случае дисэйблим кнопку
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Private Methods

    private func configureButton() {
        sendRequestButtonOutlet.layer.cornerRadius = 10
        sendRequestButtonOutlet.layer.borderWidth = 2
        sendRequestButtonOutlet.layer.borderColor = AppColors.mainThemeColor.cgColor

        sendRequestButtonOutlet.setTitle("Узнать цену", for: .normal)
        sendRequestButtonOutlet.titleLabel?.tintColor = AppColors.mainThemeColor

        sendRequestButtonOutlet.setBackgroundImage(AppColors.detailsColor.image(), for: .normal)
        sendRequestButtonOutlet.setBackgroundImage(UIColor.lightGray.image(), for: .disabled)
    }

    private func configureNavigationController() {
        let backButton = UIBarButtonItem()
        backButton.title = "назад"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }

    private func removeSelectedItem(number: Int) {
        ShopManager.shared.removeWatchList(object: watchList[number])// по порядковому номеру из массива удаляет ячейку с соответствующим индексом
        ShopManager.shared.resetCountOfCurrentObjectInShoppingCart(object: watchList[number])// устанавливает дефолтное значение количества находящегося/добавляемого в корзину
        watchList = shoppingManager.getWatchList()// обновляем значение массива с уже удаленной ячейкой
        sendRequestButtonOutlet.isEnabled = watchList.isEmpty ? false : true
    }

    // MARK: - IBActions

    @IBAction func sendRequestButtonTapped(_ sender: UIButton) {
        // устанавливаем параметры отправки email запроса
        let recipientEmail = "alexmajko.1@gmail.com"
        let subject = "Описание"
        var body = ""
        for i in watchList {
            body.append(i.objectFromPartsCatalogueListCode! + " " + i.objectFromPartsCatalogueListName!+"\n")
        }
        // вызываем дефолтный email оператор
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self // !!!
            mail.delegate = self // !!!
            mail.setToRecipients([recipientEmail])
            mail.setSubject(subject)
            mail.setMessageBody(body, isHTML: false)
            mail.modalPresentationStyle = .fullScreen
            self.present(mail, animated: true)

            // вызываем сторонний email оператор, если дефолтный отсутствует 
        } else if let emailUrl = SendEmailManager.createEmailUrl(to: recipientEmail, subject: subject, body: body) {
            UIApplication.shared.open(emailUrl)
        }
    }

    // MARK: - HZ

     func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let orderVC = segue.destination as? OrderViewController
        else { return }

        switch segue.identifier {
        case "showAgainInOrderVC":
            orderVC.selectedObject = selectedObjectFromPartsCatalogueCartList
        default:
            break
        }
    }
}

// MARK: - Cart TableView Cell Delegate

extension CartViewController: CartTableViewCellDelegate {
    func deleteButton(row: Int) {
        removeSelectedItem(number: row)
        tableView.reloadData() // обновляем наш тэйбл вью и обновляем таким образом индексы у ячеек
    }
}

// MARK: - TableView Data Source

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeSelectedItem(number: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData() // обновляем наш тэйбл вью и обновляем таким образом индексы у ячеек
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        watchList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CartTableViewCell.self), for: indexPath) as! CartTableViewCell
        cell.configure(data: watchList[indexPath.row], row: indexPath.row)
        cell.delegate = self
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedObject = watchList[indexPath.row]
        self.selectedObjectFromPartsCatalogueCartList = selectedObject
        performSegue(withIdentifier: "showAgainInOrderVC", sender: self)
    }
}

