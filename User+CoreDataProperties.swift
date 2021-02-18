//
//  User+CoreDataProperties.swift
//  SuperSwiftUIDemoApp (iOS)
//
//  Created by leng on 2021/02/18.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var age: Int32
    @NSManaged public var name: String?
    @NSManaged public var height: Float
    @NSManaged public var myClass: Class?
    @NSManaged public var myAccount: NSSet?

}

// MARK: Generated accessors for myAccount
extension User {

    @objc(addMyAccountObject:)
    @NSManaged public func addToMyAccount(_ value: Account)

    @objc(removeMyAccountObject:)
    @NSManaged public func removeFromMyAccount(_ value: Account)

    @objc(addMyAccount:)
    @NSManaged public func addToMyAccount(_ values: NSSet)

    @objc(removeMyAccount:)
    @NSManaged public func removeFromMyAccount(_ values: NSSet)

}

extension User : Identifiable {

}
