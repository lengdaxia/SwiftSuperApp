//
//  CategoryHome.swift
//  SuperSwiftUIDemoApp (iOS)
//
//  Created by leng on 2021/02/08.
//

import SwiftUI

struct CategoryHome: View {
    
  

    var categories: [String: [LandMark]] {
        Dictionary(
            grouping: landmarks, by: { $0.category.rawValue}
        )
    }
    
    var featuredLandmarks:[LandMark]{
        landmarks.filter{ $0.isFeatured}
    }
    
  
    var body: some View {
            List{
                FeaturedView(landmarks: featuredLandmarks)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted(), id: \.self){ key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())

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
