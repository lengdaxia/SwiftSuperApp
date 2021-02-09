//
//  CategoryRow.swift
//  SuperSwiftUIDemoApp (iOS)
//
//  Created by leng on 2021/02/08.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [LandMark]
    
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
                    ForEach(self.items){ item in
                        NavigationLink(destination: LandmarkDetail(landmark: item))
                        {
                                CategoryItem(landMark: item)
                        }
                    }
                }
            }
            .frame(height: 185)

            
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: AppDataStore().landmarks[0].category.rawValue,
            items: Array(AppDataStore().landmarks.prefix(4))
        )
    }
}
