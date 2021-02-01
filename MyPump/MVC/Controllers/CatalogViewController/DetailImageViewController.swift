//
//  DetailImageViewController.swift
//  MyPump
//
//  Created by Александр Майко on 31.01.2021.
//

import UIKit

class DetailImageViewController: UIViewController {

    var imageScrollView: ScrollViewManager!
    var image: UIImage?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    
    private func configureNavigationController() {
        let backButton = UIBarButtonItem()
        backButton.title = "к выбору схемы"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageScrollView = ScrollViewManager(frame: view.bounds)
        view.addSubview(imageScrollView)
        setupImageScrollView()
        self.imageScrollView.set(image: image!)
    }
    
    func setupImageScrollView() {
        imageScrollView.translatesAutoresizingMaskIntoConstraints = false
        imageScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
}
