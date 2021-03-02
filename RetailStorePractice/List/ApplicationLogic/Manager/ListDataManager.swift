//
//  ListDataManager.swift
//  RetailStorePractice
//
//  Created by Juan carlos De la parra on 01/03/21.
//

import Foundation


class ListDataManager {
    
    //var coreDataStore = CoreDataStore.sharedInstance
    var productsArray = [Product]()
    
    init() {
        if let products = readProductsFromPlist() {
            productsArray = products
        }
    }    
    //MARK: Products Fetcher Methods
    func readProductsFromPlist() -> [Product]? {
        
        let dict = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "Products", ofType: "plist")!)
        let array = (dict!["Products"] as? [Any])
    
        let productsArray = products(from: array!)
          
        return productsArray
        
    }
    
    func products(from array: [Any]) -> [Product] {
        var productsArray = [Product]()
        
        for value in array {
            if let dict = value as? [String : Any] {
                print(dict as Any)
                let newProduct = Product()
                newProduct.productId = (dict["productId"] as! NSNumber)
                newProduct.name = (dict["name"] as! String)
                newProduct.categoryId = (dict["categoryId"] as! NSNumber)
                newProduct.price = (dict["price"] as! NSNumber)
                newProduct.imageName = (dict["imageName"] as! String)
                productsArray.append(newProduct)
            }
        }
        return productsArray
    }

}
