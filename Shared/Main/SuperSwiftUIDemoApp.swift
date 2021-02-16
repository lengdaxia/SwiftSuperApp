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
    
    @NSApplicationDelegateAdaptor(MacAppDelegate.self) var macAppDelegate

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



class MacAppDelegate: NSObject, NSApplicationDelegate {
    
    var statusBarItem: NSStatusItem!
    var popover: NSPopover!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        print("hello")

        setupStatusBarItem()
    }
    

//    @State private var todoName: String = ""

    func setupStatusBarItem() {

        
        let contentView = VStack{
            Text("TodoList").font(.title)
            Spacer()
            HStack{
//                TextField("name", text: $todoName)
            }
            
            Button("Add") {
                print("add new one")
            }
        }
        let popover = NSPopover()
        popover.contentSize = NSSize(width: 350, height: 500)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: contentView)
        self.popover = popover
        
        
       
        
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        
        guard let button = self.statusBarItem.button else { return  }
        
        button.image = NSImage(systemSymbolName: "checkmark.circle.fill", accessibilityDescription: nil)
        button.action = #selector(showHidePopover(_:))
    }
    
    
    @objc func showHidePopover(_ sender: AnyObject?) {
        guard let button = self.statusBarItem.button else { return }
        if self.popover.isShown {
            self.popover.performClose(sender)
        } else {
            self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            self.popover.contentViewController?.view.window?.becomeKey()
        }
    }
}
