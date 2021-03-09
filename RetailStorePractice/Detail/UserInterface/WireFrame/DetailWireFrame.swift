//
//  DetailWireFrame.swift
//  RetailStorePractice
//
//  Created by Juan carlos De la parra on 04/03/21.
//

import Foundation
import UIKit

let DetailViewControllerIdentifier = "DetailViewController"

class DetailWireframe {
    var detailPresenter : DetailPresenter?
    var presentedViewController : DetailViewController?
    
    func presentDetailInterface(fromViewController viewController: UIViewController, withProduct product: Product) {
        let newViewController = detailViewControllerFromStoryboard()
        newViewController.eventHandler = detailPresenter
        newViewController.product = product
        detailPresenter?.userInterface = newViewController
        print(newViewController)
        viewController.navigationController?.pushViewController(newViewController, animated: true)
        
        presentedViewController = newViewController
    }

    func displayAlert(title: String? = nil, message: String? = nil) {
        var titleString = "Error"
        var messageString = "Product was already added to Cart"
        if title != nil {
            titleString = title!
        }
        if message != nil {
            messageString = message!
        }
        
        let alertController = UIAlertController(title: titleString, message: messageString, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        presentedViewController?.present(alertController, animated: true, completion: nil)
    }

    func detailViewControllerFromStoryboard() -> DetailViewController {
        let storyboard = mainStoryboard()
        print(DetailViewController())
        let viewController = storyboard.instantiateViewController(withIdentifier: DetailViewControllerIdentifier) as! DetailViewController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard
    }
    
}

