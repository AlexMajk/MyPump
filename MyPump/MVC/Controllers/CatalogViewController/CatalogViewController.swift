//
//  ViewController.swift
//  MyPump
//
//  Created by Александр Майко on 03.01.2021.
//

import UIKit
import ObjectMapper
import FirebaseDatabase

class CatalogViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference()
        ref.child("Marks/Brinkmann/Models/450b/Units/Compressor/photo/").observeSingleEvent(of: .value) { (snapshot) in
            guard let data = snapshot.value  else {return}
            if let data = data as? [String: Any] {
                if let photo = Mapper<Pumps>().map(JSON: data) {
                    print(photo.photo1)
                    print(photo.photo2)
                    print(photo.photo3)
                    print(photo.photo4)
                }
            }
        }
    }
}

