

import UIKit
import Kingfisher

class ObjectCollectionView: UICollectionViewController {
    
    
    var agregateTitle: String?
    var dawnloadedObjectFromPartsCatalogueList = [ObjectFromPartsCatalogueList]()
    var selectedObjectFromPartsCatalogueList : ObjectFromPartsCatalogueList?
    
    
    override func viewDidLoad() {
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    
    private func configureNavigationController() {
        let backButton = UIBarButtonItem()
        backButton.title = "назад"
        title = agregateTitle
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func showOrderVC(){
        let storybord = UIStoryboard(name: "MainViewController", bundle: nil)
        let vc = storybord.instantiateViewController(identifier: "orderVC") as! OrderViewController
        vc.selectedObject = selectedObjectFromPartsCatalogueList
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dawnloadedObjectFromPartsCatalogueList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell4", for: indexPath) as! ObjectCollectionViewCell
        cell.configure(data: dawnloadedObjectFromPartsCatalogueList[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedObject = dawnloadedObjectFromPartsCatalogueList[indexPath.row]
        self.selectedObjectFromPartsCatalogueList = selectedObject
        //performSegue(withIdentifier: "getOrderVC", sender: self)
        showOrderVC()
    }
    
    
    deinit {
        print("deinit")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let orderVC = segue.destination as? OrderViewController
        else { return }
        
        switch segue.identifier {
        
        case "getOrderVC":
            orderVC.selectedObject = selectedObjectFromPartsCatalogueList
            
        default:
            break
        }
    }
}

extension ObjectCollectionView: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2 //ячеек на ряд
        let paddingWidth = 5 * (itemsPerRow + 1)
        let avilableWith = collectionView.frame.width - paddingWidth // доступная ширина для нашего использования
        let itemWidth = avilableWith / itemsPerRow
        
        return CGSize(width: itemWidth, height: (itemWidth + 20))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
        
    }
    
    
}
