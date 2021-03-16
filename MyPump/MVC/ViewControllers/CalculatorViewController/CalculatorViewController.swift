//
//  CalculatorViewController.swift
//  MyPump
//
//  Created by пользователь on 1/6/21.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.title = "Калькулятор"
        
        
        collectionView.register(UINib(nibName: String(describing: OblectCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: OblectCollectionViewCell.self))
    }

}

extension CalculatorViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: OblectCollectionViewCell.self), for: indexPath) as! OblectCollectionViewCell
        
        cell.configure()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let  size = self.view.frame.width / 2 
        return CGSize(width: size, height: size + 35)
    }
}
