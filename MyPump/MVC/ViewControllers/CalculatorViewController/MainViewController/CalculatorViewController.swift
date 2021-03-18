//
//  CalculatorViewController.swift
//  MyPump
//
//  Created by пользователь on 1/6/21.
//

import UIKit

struct SpareModel {
    var name: String?
    var subtitle: String?
    var imageName: String?
    
    internal init (name: String? = nil, subtitle: String? = nil, imageName: String? = nil ) {
        self.name = name
        self.subtitle = subtitle
        self.imageName = imageName
    }
}

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var spareList: [SpareModel] = []
    
    override func viewDidLoad(){
        super.viewDidLoad()
        spareList = [SpareModel(name: "Запчасти", subtitle: "для бетононасосов",
                                imageName: "zapchasti-groups"),
                     SpareModel(name: "Запчасти", subtitle: "для штукатурных станций",
                                imageName: "fitinfyv"),
                     SpareModel(name: "Запчасти", subtitle: "для затировочных машин",
                                imageName: "fitinfyv"),
                     SpareModel(name: "Фитинги", subtitle: "муфты и соединения",
                                imageName: "fitinfyv"),
                     SpareModel(name: "Рукава", subtitle: "шланги и гасители",
                                imageName: "new-trubasd"),
                     SpareModel(name: "Масла и смазки", subtitle: "для ДВС и компрессора",
                                imageName: "masla-1"),
                     SpareModel(name: "Инструменты", subtitle: "и спецодежда",
                                imageName: "fitinfyv"),
                     SpareModel(name: "Измерительное оборудование", subtitle: "лазеры, нивилиры",
                                imageName: "shtyksad")]
        
        self.title = "Калькулятор"
        collectionView.register(UINib(nibName: String(describing: OblectCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: OblectCollectionViewCell.self))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    private func showSpareViewController(spare: SpareModel) {
        let viewController = SpareViewController(spare: spare)
        navigationController?.pushViewController(viewController, animated: true)
    }
    @IBAction func watchListButtonPressed(_ sender: UIBarButtonItem) {
        let watchListViewController = WatchListViewController(name: "")
        watchListViewController.modalTransitionStyle = .flipHorizontal
        present(watchListViewController, animated: true, completion: nil)
    }
}

extension CalculatorViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spareList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: OblectCollectionViewCell.self), for: indexPath) as! OblectCollectionViewCell
        cell.configure(data: spareList[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let  size = self.view.frame.width / 2 
        return CGSize(width: size, height: size + 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let spare = spareList[indexPath.item]
        showSpareViewController(spare: spare)
    }
}
