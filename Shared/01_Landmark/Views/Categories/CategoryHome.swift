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
    
    var body: some View {
        NavigationView{
            ScrollView{
                List{
                    ForEach(categories.keys.sorted(), id: \.self){ key in
                        CategoryRow(categoryName: key, items: self.categories[key]!)
                    }
                }
            }
            .navigationBarTitle(Text("Featured"))
            
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
