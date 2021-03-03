//
//  ListCell.swift
//  RetailStore
//


import Foundation
import UIKit

class ListCell: UITableViewCell {
    
    static let Identifier = "ListCell"
    
   
    @IBOutlet internal var productImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var priceLabel: UILabel!

//    func configureWithProduct(product: Product) {
//        guard let productName = product.name else {
//            return
//        }
//
//        nameLabel.text = productName
//        productImageView.image = UIImage(named: product.imageName)
//    }

    //add
    func configureWithProduct(product: Product) {
        guard let productName = product.name else {
            return
        }

        guard let productPrice = product.price else {
            return
        }

        nameLabel.text = productName
        priceLabel.text = productPrice.stringValue 
        productImageView.image = UIImage(named: product.imageName)
    }
}
