//
//  Account+CoreDataProperties.swift
//  SuperSwiftUIDemoApp (iOS)
//
//  Created by leng on 2021/02/18.
//
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var currentMoney: Double
    @NSManaged public var owner: User?

}

extension Account : Identifiable {

}
