//
//  ListCell.swift
//  RetailStore
//


import Foundation
import UIKit

class ListCell: UITableViewCell {
    
    static let Identifier = "ListCell"
    
   
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var priceLabel: UILabel!
   
    func configureWithProduct(product: Product) {
        guard let productName = product.name else {
            return
        }
        
        nameLabel.text = productName
        productImageView.image = UIImage(named: product.imageName)
    }
    
}
