//
//  ViewModel.swift
//  MyPump
//
//  Created by Александр Майко on 24.03.2021.
//

import UIKit

enum ViewModelItemType {
    case objectFromPartsCatalogueListName
    case objectFromPartsCatalogueListDescription
    case objectFromPartsCatalogueListCode
    case objectFromPartsCatalogueListOEMCode
}

protocol ViewModelItem {
    var type : ViewModelItemType { get }
    var rowCount : Int { get }
    var sectionTitle : String { get }
    
}


extension ViewModelItem {// делаем данные по умолчанию, чтобы не менять если они равны необходимым данным
    var rowCount: Int { // почему с ретёрн, а не просто указать значение?
        return 1
    }
}

class ViewModelNameItem : ViewModelItem {
    var type: ViewModelItemType {
       return .objectFromPartsCatalogueListName
    }
    
    var sectionTitle: String {
        return "Наименование:"
     }
    var name: String
    init (name: String) {
       self.name = name
    }
    
}

class ViewModelDescriptionItem: ViewModelItem {
   var type: ViewModelItemType {
      return .objectFromPartsCatalogueListDescription
   }
   var sectionTitle: String {
    return "Описание:"
   }
   var description: String
  
   init(description: String) {
      self.description = description
   }
}
class ViewModelCodeItem: ViewModelItem {
   var type: ViewModelItemType {
      return .objectFromPartsCatalogueListCode
   }
   var sectionTitle: String {
    return "Артикул:"
   }
   var code: String
   init(code: String) {
      self.code = code
   }
}

class ViewModelOEMCodeItem: ViewModelItem {
   var type: ViewModelItemType {
      return .objectFromPartsCatalogueListOEMCode
   }
   var sectionTitle: String {
    return "Оригинальный номер:"
   }
 
   var rowCount: Int {
      return 1
   }
   var oemCode: String
   init(oemCode: String) {
      self.oemCode = oemCode
   }
}

class ViewModel: NSObject {
   var items = [ViewModelItem]()

    init(data: ObjectFromPartsCatalogueList) {
          super.init()
        
        if let name = data.objectFromPartsCatalogueListName {
         let nameItem = ViewModelNameItem(name: name)
         items.append(nameItem)
      }
        if let description = data.objectFromPartsCatalogueListDescription {
        let descriptionItem = ViewModelDescriptionItem(description:description)
         items.append(descriptionItem)
      }
        if let code = data.objectFromPartsCatalogueListCode {
         let codeItem = ViewModelCodeItem(code: code)
         items.append(codeItem)
      }
        if let oemCode = data.objectFromPartsCatalogueListOEMCode {
         let oemCodeItem = ViewModelOEMCodeItem(oemCode: oemCode)
         items.append(oemCodeItem)
      }
   }
}

