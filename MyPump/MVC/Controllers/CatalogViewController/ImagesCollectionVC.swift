

import UIKit
import Kingfisher

class ImagesCollectionVC: UICollectionViewController {
    
    var agregateTitle: String?
    var partListImageRef = [String]()
    let itemsPerRow: CGFloat = 2 //вынесли из метода, так как здесь удобнее вносить изменения
    let sectionsInsets = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10) // аналогично
    
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
        let paddingWidth = sectionsInsets.left * (itemsPerRow + 1)
        let itemWidth = (collectionView.frame.width - paddingWidth) / itemsPerRow
        let itemHight = itemWidth
        return CGSize(width: itemWidth, height: itemHight)
    }
}
