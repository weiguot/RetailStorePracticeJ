//
//  RootWireFrame.swift
//  RetailStorePractice
//
//  Created by Field Employee on 3/2/21.
//

import Foundation

class RootWireFrame : NSObject {
    func showRootViewController (_ viewController: UIViewController, inWindow: UIWindow){
        let navigationController = navigationControllerFromWindow(inWindow)
        navigationController.viewCOntrollers = [viewController]
        
    }
    
    func navigationControllerFromWindow(_ window: UIWindow) -> UINavigationController {
        let navigationController = window.rootViewController as! UINavigationController
        return navigationController
    }
}
