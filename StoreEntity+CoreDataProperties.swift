//
//  StoreEntity+CoreDataProperties.swift
//  
//
//  Created by Field Employee on 3/2/21.
//
//

import Foundation
import CoreData


extension StoreEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoreEntity> {
        return NSFetchRequest<StoreEntity>(entityName: "CartEntity")
    }

    @NSManaged public var productId: Int16

}
