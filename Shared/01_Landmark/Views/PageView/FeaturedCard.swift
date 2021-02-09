//
//  FeaturedCard.swift
//  SuperSwiftUIDemoApp (iOS)
//
//  Created by leng on 2021/02/09.
//

import SwiftUI

struct FeaturedCard: View {
    var landmark: LandMark
    
    var body: some View {
        
        landmark.featuredImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay(TextOverlay(landmark: landmark))
    }
}

struct TextOverlay: View {
    var landmark: LandMark
    var gradient: LinearGradient{
        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.6), Color.black.opacity(0)]), startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View{
        ZStack(alignment:.bottomLeading){
            Rectangle().fill(gradient)
            VStack(alignment: .leading){
                Text(landmark.name)
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(landmark.park)
            }.padding()
         
        }
        .foregroundColor(.white)
    }
}
struct FeaturedCard_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCard(landmark: AppDataStore().features[0])
    }
}
