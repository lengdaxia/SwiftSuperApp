//
//  CategoryHome.swift
//  SuperSwiftUIDemoApp (iOS)
//
//  Created by leng on 2021/02/08.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var appData: AppDataStore
    
    var categories: [String: [LandMark]] {
        appData.categories
    }
    
    var featuredLandmarks:[LandMark]{
        appData.features
    }
    
  
    var body: some View {
            List{
                PageView(pages: appData.features.map { FeaturedCard(landmark: $0)})
                    .aspectRatio(/*@START_MENU_TOKEN@*/1.5/*@END_MENU_TOKEN@*/, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted(), id: \.self){ key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                .listStyle(InsetListStyle())
                }
            }
}


struct FeaturedView: View {
    
    var landmarks: [LandMark]
    var body: some View{
        landmarks[0].image.resizable()
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(AppDataStore())
    }
}
