//
//  LandmarkList.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/02/08.
//

import SwiftUI

struct LandmarkList: View {
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
    
    var body: some View {
        
            List{
                
                Toggle(isOn: $appData.showFavoritesOnly, label: {
                    Text("Favorite Only")
                })
                
                
                ForEach(appData.landmarks){ landmark in
                    
                    if !self.appData.showFavoritesOnly || landmark.isFavorite{
                        
                    NavigationLink(
                        destination:LandmarkDetail(landmark: landmark)){
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(AppDataStore())
    }
}
