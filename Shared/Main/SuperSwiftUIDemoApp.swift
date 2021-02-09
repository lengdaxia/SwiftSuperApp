//
//  SuperSwiftUIDemoAppApp.swift
//  Shared
//
//  Created by leng on 2021/02/08.
//

import SwiftUI

@main
struct SuperSwiftUIDemoApp: App {
    
//    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) private var scenePhase

    @State var appDataStore = AppDataStore()

    var body: some Scene {
        
            #if os(macOS)
            let mainWindow = WindowGroup {
                MacContentView().environmentObject(appDataStore)
            }
            
            #elseif os(iOS)
            let mainWindow = WindowGroup {
                DemoList()
                    .environmentObject(appDataStore)
            }
            #endif
            
// persistenceController.container.viewContext)
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        
            #if os(macOS)
                mainWindow
                    .commands{
                        LandmarkCommands()
                    }
            #elseif os(iOS)
                mainWindow
            #endif
        
            
            #if os(watchOS)
                WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
            #endif
            
            #if os(macOS)
            Settings{
                LandmarkSettings()
            }
            #endif
        
//        监听环境的值变化的回调
        mainWindow.onChange(of: scenePhase) { (newScenePhase) in
            
            switch newScenePhase{
            case.background:
                print("app enter background")
            case .inactive:
                print("app enter inactive")
            case .active:
                print("app enter active")
            @unknown default:
                print("app enter unknown")
            }
        }
        
//        open url
    
        
     
        
    }
}
