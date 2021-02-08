//
//  CategoryItem.swift
//  SuperSwiftUIDemoApp (iOS)
//
//  Created by leng on 2021/02/08.
//

import SwiftUI

struct CategoryItem: View {
    var landMark: LandMark
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            landMark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(5.0)
            Text(landMark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landMark: landmarks[4])
    }
}
