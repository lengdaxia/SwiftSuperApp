//
//  MacLandmarkList.swift
//  SuperSwiftUIDemoApp (macOS)
//
//  Created by leng on 2021/02/09.
//

import SwiftUI

struct MacLandmarkList: View {
    @EnvironmentObject var appData: AppDataStore
    
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: LandMark?
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: FilterCategory {self}
    }
    
    var title: String{
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return appData.showFavoritesOnly ? "Favorite \(title)":  title
    }
    var index: Int?{
        appData.landmarks.firstIndex(where: {$0.id == selectedLandmark?.id})
    }
    var filterdLandmarks:[LandMark]{
        appData.landmarks.filter{ landmark in
            (!appData.showFavoritesOnly || landmark.isFavorite) && (filter == .all || filter.rawValue == landmark.category.rawValue )
        }
    }
    var body: some View {
        
        NavigationView{
            List(selection: $selectedLandmark){
                ForEach(filterdLandmarks){ landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)
                    ){
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }.navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar{
                ToolbarItem{
                    Button(action: toggleSidebar, label: {
                        Image(systemName: "sidebar.left")
                    })
                }
                
                ToolbarItem{
                    Menu {
                        Picker("Category", selection: $filter){
                            ForEach(FilterCategory.allCases){ cate in
                                Text(cate.rawValue).tag(cate)
                            }
                        }
                        
                        Toggle(isOn: $appData.showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    }
                    label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                    
                }
            }
            Text("Select a Landmark")
        }
        .focusedValue(\.selectedLandmark, $appData.landmarks[index ?? 0])
    }
    
    private func toggleSidebar() {
        #if os(iOS)
        #else
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        #endif
    }
}

struct MacLandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        MacLandmarkList()
            .environmentObject(AppDataStore())
    }
}
