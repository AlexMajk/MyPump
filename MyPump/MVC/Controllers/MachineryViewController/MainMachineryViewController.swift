//
//  CalculatorViewController.swift
//  MyPump
//
//  Created by пользователь on 1/6/21.
//

import UIKit

class MainMachineryViewController: UIViewController {
    @IBOutlet weak var machineryMainCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        machineryMainCollectionView.register(UINib(nibName: "MainMachineryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainMachineryCollectionViewCell")
        
    }
    
}

extension MainMachineryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainMachineryCollectionViewCell", for: indexPath) as! MainMachineryCollectionViewCell
        cell.backgroundColor = .lightGray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width - 20, height: view.frame.height/3)
    }
    
    
}
