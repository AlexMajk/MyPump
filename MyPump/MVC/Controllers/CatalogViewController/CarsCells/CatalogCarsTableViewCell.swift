//
//  CatalogCarsTableViewCell.swift
//  MyPump
//
//  Created by пользователь on 1/21/21.
//

import UIKit

class CatalogCarsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var markImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(title: String?, markImageUrlString: String) {
        titleLabel.text = title
        
        let url = URL(string: markImageUrlString)!
        downloadImage(from: url)
    }

    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

    func downloadImage(from url: URL) {
        getData(from: url) {data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self!.markImageView.image = UIImage(data: data)
            }
        }
    }
}
