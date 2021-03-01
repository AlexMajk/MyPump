

import UIKit
import Kingfisher

class ImagesCollectionVC: UICollectionViewController {
    
    var agregateTitle: String?
    var partListImageRef = [String]()

    
    override func viewDidLoad() {
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    
    private func configureNavigationController() {
        let backButton = UIBarButtonItem()
        backButton.title = "к выбору узла"
        title = agregateTitle
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return partListImageRef.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell4", for: indexPath) as! ImagesCollectionViewCell
        cell.configure(url: partListImageRef[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "getDetailVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailImageVC = segue.destination as? DetailImageViewController
        else { return }
        switch segue.identifier {
        case "getDetailVC":
            let indexPathFromSelectedItem = collectionView.indexPathsForSelectedItems?.first
            let cell = collectionView.cellForItem(at: indexPathFromSelectedItem!) as? ImagesCollectionViewCell
            detailImageVC.image = cell?.imageFromCell.image
        default:
            break
        }
    }
    
    deinit {
        print("deinit")
    }
}

extension ImagesCollectionVC: UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2 //ячеек на ряд
        let paddingWidth = 5 * (itemsPerRow + 1)
        let avilableWith = collectionView.frame.width - paddingWidth // доступная ширина для нашего использования
        let itemWidth = avilableWith / itemsPerRow
////        let itemHight = itemWidth
//        let itemHight =
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
