//
//  Class+CoreDataProperties.swift
//  SuperSwiftUIDemoApp (iOS)
//
//  Created by leng on 2021/02/18.
//
//

import Foundation
import CoreData


extension Class {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Class> {
        return NSFetchRequest<Class>(entityName: "Class")
    }

    @NSManaged public var name: String?
    @NSManaged public var myUsers: NSSet?

}

// MARK: Generated accessors for myUsers
extension Class {

    @objc(addMyUsersObject:)
    @NSManaged public func addToMyUsers(_ value: User)

    @objc(removeMyUsersObject:)
    @NSManaged public func removeFromMyUsers(_ value: User)

    @objc(addMyUsers:)
    @NSManaged public func addToMyUsers(_ values: NSSet)

    @objc(removeMyUsers:)
    @NSManaged public func removeFromMyUsers(_ values: NSSet)

}

extension Class : Identifiable {

}
