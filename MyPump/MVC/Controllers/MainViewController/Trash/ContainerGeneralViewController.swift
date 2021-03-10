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
    var backgroundColor: UIColor
    var name: String
    var Description: String
}

class ContainerGeneralViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var menu: SideMenuNavigationController?
    private var selectedCurrencyIndex = 0
    
    let marksPumpsList = [MarksPumps(backgroundColor: .red,
                                     name: "putzmeister",
                                     Description: "Good Pumps"),
                          MarksPumps(backgroundColor: .yellow,
                                     name: "Brinkmann",
                                     Description: "Good Pumps"),
                          MarksPumps(backgroundColor: .green,
                                     name: "BMS",
                                     Description: "Good Pumps"),
                          MarksPumps(backgroundColor: .red,
                                     name: "Другие запчасти",
                                     Description: "Good Pumps"),
                          MarksPumps(backgroundColor: .red,
                                     name: "Видео Руководство",
                                     Description: "Good Pumps")]
    
    @IBOutlet weak var containerView: UIView!
    
    private let pageMaster = PageMaster([])

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageMaster()
        setupCollectionViewUI()
        setupUIView()
        let storyboard = UIStoryboard(name: "MainViewController", bundle: nil)
        let sideMenuViewController = storyboard.instantiateViewController(identifier: "SideMenuViewController") as! SideMenuViewController
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
        var vcList: [UIViewController] = []
        let storyboard = UIStoryboard(name: "MainViewController", bundle: nil)
       
        for _ in 0 ... marksPumpsList.count - 3 {
            let vc = storyboard.instantiateViewController(identifier: "MarkPumpsViewController") as! MarkPumpsViewController
            vcList.append(vc)
        }
        let vc = storyboard.instantiateViewController(identifier: "OtherAccessoriesViewController") as! OtherAccessoriesViewController
        vcList.append(vc)
        
        let watchVc = storyboard.instantiateViewController(identifier: "WatchViewController") as! WatchViewController
        vcList.append(watchVc)
        
        self.pageMaster.setup(vcList)
        self.addChild(self.pageMaster)
        containerView.addSubview(self.pageMaster.view)
        self.pageMaster.view.frame = containerView.bounds
        self.pageMaster.didMove(toParent: self)
    }
    
    @IBAction func MenuButtonPressed(_ sender: UIBarButtonItem) {
        
        
        present(menu!, animated: true)
    }
    private func setupCollectionViewUI() {
        collectionView.register(UINib(nibName: "MarkPumpsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MarkPumpsCollectionViewCell")
    }
}

extension ContainerGeneralViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return marksPumpsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarkPumpsCollectionViewCell", for: indexPath) as! MarkPumpsCollectionViewCell
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

