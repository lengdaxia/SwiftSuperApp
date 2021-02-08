//
//  LandmarkRow.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/02/08.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: LandMark
    
    var body: some View {
        HStack{
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite{
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(Color.yellow)
                
            }
        }
    }
}


struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[0])
                .preferredColorScheme(.dark)
        }.previewLayout(.fixed(width: 300, height: 70))

    }
}
