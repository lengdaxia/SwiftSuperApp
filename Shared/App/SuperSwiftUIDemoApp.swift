//
//  SuperSwiftUIDemoAppApp.swift
//  Shared
//
//  Created by leng on 2021/02/08.
//

import SwiftUI

@main
struct SuperSwiftUIDemoApp: App {
    
    let persistenceController = PersistenceController.shared
    
    @State var appDataStore = AppDataStore()

    var body: some Scene {
        WindowGroup {
            DemoList().environmentObject(appDataStore)
            
//            LandmarkList()
//            AppContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
