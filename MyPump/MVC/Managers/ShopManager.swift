//
//  ShopManager.swift
//  MyPump
//
//  Created by Александр Майко on 20.03.2021.
//

import UIKit

class ShopManager {
    
    static var shared = ShopManager()
    
    private var watchList: [ObjectFromPartsCatalogueList] = []
    
    func addWatchList(product: ObjectFromPartsCatalogueList ) {
        watchList.append(product)
    }
    
    func removeWatchList() {
        
    }
    
    func getWatchList() -> [ObjectFromPartsCatalogueList] {
        return watchList
    }
    
    func removeAllWatchList() {
    
    }
    
    private init () {}
    
}

