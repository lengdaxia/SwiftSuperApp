//
//  SuperSwiftUIDemoAppApp.swift
//  WatchLandmarks Extension
//
//  Created by Marlon on 2021/2/9.
//

import SwiftUI

@main
struct SuperSwiftUIDemoAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(AppDataStore())
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
