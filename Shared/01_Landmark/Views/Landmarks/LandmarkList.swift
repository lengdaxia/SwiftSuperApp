//
//  LandmarkList.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/02/08.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var appData: AppDataStore
    
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
