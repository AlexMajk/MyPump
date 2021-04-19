//
//  CalculatorViewController.swift
//  MyPump
//
//  Created by пользователь on 1/6/21.
//

import UIKit

class MainMachineryViewController: UIViewController {
    var downloadedCatalogueMachinery = [CatalogueMachinery]()
    @IBOutlet weak var machineryMainCollectionView: UICollectionView!

    override func viewDidLoad() {
        NetworkManager.FirstLaunchCatalogueMachineryFetchData { [weak self] data in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.downloadedCatalogueMachinery = data
                self.machineryMainCollectionView.reloadData()
            }
        }
        machineryMainCollectionView.register(UINib(nibName: "MainMachineryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainMachineryCollectionViewCell")
    }
}

extension MainMachineryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        downloadedCatalogueMachinery.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainMachineryCollectionViewCell", for: indexPath) as! MainMachineryCollectionViewCell
        let dataForCell = downloadedCatalogueMachinery[indexPath.row]
        cell.configureCell(data: dataForCell)
        cell.backgroundColor = .lightGray
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width - 20, height: view.frame.height / 3)
    }
}
