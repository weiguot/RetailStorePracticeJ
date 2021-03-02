//
//  Constants.swift
//  RetailStorePractice
//
//  Created by Juan carlos De la parra on 01/03/21.
//

import Foundation

enum Category : Int {
    case Electronics = 1, Furniture
    
    func title() -> String {
        switch self {
        case.Electronics:
            return "Electronics"
        default:
            return "Furniture"
        }
    }
}
