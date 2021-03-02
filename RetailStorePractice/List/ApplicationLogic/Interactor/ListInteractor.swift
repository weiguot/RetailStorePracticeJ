//
//  ListInteractor.swift
//  RetailStorePractice
//
//  Created by Juan carlos De la parra on 01/03/21.
//

import Foundation
import RxSwift
import RxCocoa

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
            let array = [prod]
            self.products.accept(array)
        }
        
    }
    
}
