//
//  HomeTabView.swift
//  SuperSwiftUIDemoApp (iOS)
//
//  Created by Marlon on 2021/2/8.
//

import SwiftUI

struct HomeTabView: View {
    @EnvironmentObject var appData: AppDataStore
    @State var showingProfile = false
    
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var profileButton: some View{
        Button(action: {
            self.showingProfile.toggle()
        }){
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    
    var body: some View {
        
        TabView(selection: $selection){
            CategoryHome()
                .tabItem{
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem{
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
        
        #if os(iOS)

        #endif
        
//        .navigationBarTitle( selection == Tab.featured ? "Featured" : "List")
//        .navigationBarItems(trailing:selection == Tab.featured ? profileButton : nil)
//        .sheet(isPresented: $showingProfile){
//                ProfileHost()
//                    .environmentObject(self.appData)
//            }
        
    
      
    }
}

struct HomeTabView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeTabView()
            .environmentObject(AppDataStore())
    }
}
