//
//  DemoModel.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/02/08.
//

import Foundation

struct DemoModel : Identifiable{
//    var id: ObjectIdentifier
    
    var id = UUID()
    var name: String
    var description: String
}
