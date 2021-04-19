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
    
    func addWatchList(object: ObjectFromPartsCatalogueList ) {
        for (index, item) in watchList.enumerated() {
            if item.objectFromPartsCatalogueListCode == object.objectFromPartsCatalogueListCode {
                watchList.remove(at: index)
            }
        }
        watchList.append(object)
    }
    
    func choosingSourceForObject(object:ObjectFromPartsCatalogueList)-> ObjectFromPartsCatalogueList {
        for item in watchList {
            if item.objectFromPartsCatalogueListCode == object.objectFromPartsCatalogueListCode {
                return item
            }
        }
        return object
    }
    
    func removeWatchList(object: ObjectFromPartsCatalogueList) {
        
        for (index, item) in watchList.enumerated() {
            if item.objectFromPartsCatalogueListCode == object.objectFromPartsCatalogueListCode {
                watchList.remove(at: index)
            }
        }
    }
    
    func getWatchList() -> [ObjectFromPartsCatalogueList] { // ПОЧЕМУ МЕТОДОМ, А НЕ ПРОСТО ПЕРЕМЕННОЙ?
        return watchList
    }
    
    func resetCountOfCurrentObjectInShoppingCart(object: ObjectFromPartsCatalogueList) {
        object.countOfCurrentObjectInShoppingCart = 1
    }
    
    func removeAllWatchList() {
        watchList.removeAll()
    }
    
    private init () {}
    
}

