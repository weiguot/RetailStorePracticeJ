//
//  ListViewWireFrame.swift
//  RetailStorePractice
//
//  Created by Field Employee on 3/2/21.
//

//import Foundation

// ListViewWireFrame.swift
// RetailStorePractice
//
// Created by Juan carlos De la parra on 02/03/21.
//



import Foundation
import UIKit

let ListViewControllerIdentifier = "ListViewController"

class ListWireframe : NSObject {
    var listPresenter : ListPresenter?
    var rootWireframe : RootWireframe?
    var listViewController : ListViewController?
    
    func configuredListViewController() -> ListViewController {
        let viewController = listViewControllerFromStoryboard()
        viewController.eventHandler = listPresenter
        listViewController = viewController
        listPresenter?.userInterface = viewController
        return viewController
    }
    
    func presentListInterfaceFromWindow(_ window: UIWindow) {
        let viewController = configuredListViewController()
        rootWireframe?.showRootViewController(viewController, inWindow: window)
    }
    
    func listViewControllerFromStoryboard() -> ListViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewController(withIdentifier: ListViewControllerIdentifier) as! ListViewController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard
    }
    
}
