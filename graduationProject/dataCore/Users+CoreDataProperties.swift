//
//  Users+CoreDataProperties.swift
//  graduationProject
//
//  Created by hassan sayed on 8/14/22.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var pass: String?

}

extension Users : Identifiable {

}
