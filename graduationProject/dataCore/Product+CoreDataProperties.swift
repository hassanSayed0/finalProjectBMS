//
//  Product+CoreDataProperties.swift
//  graduationProject
//
//  Created by hassan sayed on 8/14/22.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var id: Int32
    @NSManaged public var price: Double
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var descript: String?
    @NSManaged public var isAdd: Bool
    @NSManaged public var boughtItem: Int32
    @NSManaged public var isValid: Bool

}

extension Product : Identifiable {

}
