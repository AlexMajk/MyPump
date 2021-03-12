//
//  ContainerGeneralViewController.swift
//  MyPump
//
//  Created by пользователь on 3/8/21.
//

import UIKit
import PageMaster
import SideMenu

struct MarksPumps {
    var name: String
    var description: String
    var screenType: ScreenType
}

class ContainerGeneralViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var containerView: UIView!
    
    private var menu: SideMenuNavigationController?
    private var selectedCurrencyIndex = 0
    private let marksPumpsList = [MarksPumps(name: "Putzmeister",
                                             description: "Good Pumps",
                                             screenType: .pumpsScreen),
                                  MarksPumps(name: "Brinkmann",
                                             description: "Good Pumps",
                                            screenType: .pumpsScreen),
                                  MarksPumps(name: "BMS",
                                             description: "Good Pumps",
                                             screenType: .pumpsScreen),
                                  MarksPumps(name: "Другие запчасти",
                                             description: "Good Pumps",
                                             screenType: .other)
    ]
    
    private let pageMaster = PageMaster([])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageMaster()
        setupCollectionViewUI()
        setupUIView()
        setupSideMenu()
    }
    
    private func setupSideMenu() {
//        let storyboard = UIStoryboard(name: "MainViewController", bundle: nil)
        let sideMenuViewController = SideMenuViewController(name: "")
//            storyboard.instantiateViewController(identifier: "SideMenuViewController") as! SideMenuViewController
        menu = SideMenuNavigationController(rootViewController: sideMenuViewController)
        menu?.blurEffectStyle = .dark
        menu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    private func setupUIView() {
        self.title = "Бетононасосы"
    }
    
    private func setupPageMaster() {
        self.pageMaster.pageDelegate = self
        var viewControllers: [UIViewController] = []
        for pumps in marksPumpsList {
            let viewController = MarkPumpViewController(markPump: pumps)
            viewControllers.append(viewController)
        }
        
        self.pageMaster.setup(viewControllers)
        self.addChild(self.pageMaster)
        containerView.addSubview(self.pageMaster.view)
        self.pageMaster.view.frame = containerView.bounds
        self.pageMaster.didMove(toParent: self)
    }
    
    @IBAction func MenuButtonPressed(_ sender: UIBarButtonItem) {
        present(menu!, animated: true)
    }
    
    private func setupCollectionViewUI() {
        collectionView.register(UINib(nibName: String(describing: MarkPumpsCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: MarkPumpsCollectionViewCell.self))
    }
}

extension ContainerGeneralViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return marksPumpsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MarkPumpsCollectionViewCell.self), for: indexPath) as! MarkPumpsCollectionViewCell
        cell.configure(title: marksPumpsList[indexPath.item].name, isSelected: indexPath.item == selectedCurrencyIndex)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item < marksPumpsList.count {
            pageMaster.setPage(indexPath.item, animated: true)
            selectedCurrencyIndex = indexPath.item
        }
    }
}

extension ContainerGeneralViewController: PageMasterDelegate {
    
    func pageMaster(_ master: PageMaster, didChangePage page: Int) {
        if page <= marksPumpsList.count {
            selectedCurrencyIndex = page
            collectionView.scrollToItem(at:IndexPath(item: page, section: 0),
                                        at: .centeredHorizontally, animated: true)
            collectionView.reloadData()
        }
    }
}

