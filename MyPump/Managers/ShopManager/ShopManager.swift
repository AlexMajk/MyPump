//
//  ShopManager.swift
//  MyPump
//
//  Created by пользователь on 3/19/21.
//

import Foundation

class ShopManager {
    
    static var shared = ShopManager()
    
    private var watchList: [ProductModel] = []
    
    func addWatchList(product: ProductModel ) {
        watchList.append(product)
    }
    
    func removeWatchList() {
        
    }
    
    func getWatchList() -> [ProductModel] {
        return watchList
    }
    
    func removeAllWatchList() {
    
    }
    
    private init () {}
    
}
