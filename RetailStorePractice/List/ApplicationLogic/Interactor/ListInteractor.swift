//
//  ListInteractor.swift
//  RetailStorePractice
//
//  Created by Juan carlos De la parra on 01/03/21.
//

//
// ListInteractor.swift
// RetailStorePractice
//
// Created by Juan carlos De la parra on 01/03/21.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

class ListInteractor {
    
    let dataManager : ListDataManager
    var products: BehaviorRelay<[Product]> = BehaviorRelay(value: [])
    
    init(dataManager: ListDataManager) {
        self.dataManager = dataManager
    }
    
    func fetchProductsFromStore() {
        var array = self.products.value
        array.removeAll()
        self.products.accept(array)
        for prod in dataManager.productsArray {
            
            array.append(prod)
        }
        
        self.products.accept(array)
        
        
    }
    
    func sectionedData(data: [Product]) -> [SectionModel<NSNumber, Product>] {
        
        var sectioned = [SectionModel<NSNumber, Product>]()
        for index in Category.Electronics.rawValue...Category.Furniture.rawValue {
            let filteredProducts = filterProducts(data: data, withCategoryId: index)
            let sectionModel = SectionModel(model: NSNumber(value: index), items: filteredProducts)
            sectioned.append(sectionModel)
        }
        
        return removeEmptySections(sectionArray: sectioned)
    }
    
    func removeEmptySections(sectionArray: [SectionModel<NSNumber, Product>]) -> [SectionModel<NSNumber, Product>] {
        var filteredSections = [SectionModel<NSNumber, Product>]()
        for sectionModel in sectionArray {
            if sectionModel.items.count > 0 {
                filteredSections.append(sectionModel)
            }
        }
        return filteredSections
    }
    
    func filterProducts(data: [Product], withCategoryId categoryId: Int) -> [Product] {
        let returnValue = data.filter({
            return $0.categoryId.intValue == categoryId
        })
        return returnValue
    }
    
}
