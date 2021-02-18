//
//  SwiftUIImageView.swift
//  SuperSwiftUIDemoApp (iOS)
//
//  Created by leng on 2021/02/17.
//

import SwiftUI

struct ImageView1: View {
    var body: some View{
        Image(systemName:"cloud.heavyrain.fill")
    }
}

struct SwiftUIImageView: View {
    var body: some View {
        
        VStack{
            
            Image("twinlake")
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius:7)
                .blur(radius: 1)
            
                
            
            
//            ProgressView("Text", value: 10, total: 100)
        }
    }
}

struct SwiftUIImageView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIImageView()
    }
}
