//
//  ListPresenter.swift
//  RetailStorePractice
//
//  Created by Juan carlos De la parra on 01/03/21.
//

import Foundation
import UIKit
import RxSwift

class ListPresenter {
    var listInteractor : ListInteractor?
    var userInterface : ListViewController?
    let disposeBag = DisposeBag()
    
    func updateView() {
        //Products
        listInteractor?.fetchProductsFromStore()
            .asObservable().subscribe( {onNext in
                guard let products = self.listInteractor?.products else {
                    return
                }
                if let sectioned = self.listInteractor?.sectionedData(data: products.value) {
                    self.updateUserInterface(withSectionedProducts: sectioned)
                }
            })
            .addDisposableTo(disposeBag)
    }
    
    func updateUserInterface(withSectionedProducts sectionedProducts: [SectionModel<NSNumber, Product>]) {
        userInterface?.showProducts(sectioned: sectionedProducts)
    }
    

}

