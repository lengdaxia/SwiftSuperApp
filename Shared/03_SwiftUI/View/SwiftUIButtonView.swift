//
//  SwiftUIButtonView.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/02/11.
//

import SwiftUI

struct SwiftUIButtonView: View {
    var body: some View {
        List{
            
            Button(action: {
                print("Clicked button")
            }, label: {
                Text("Button")
            })
            
            Button(action: {
                print("Button2 clicked")
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.purple)
                    .font(.largeTitle)
                    .padding()
                    .border(Color.purple, width: 5)
                
            })
        }
    }
        
}

struct SwiftUIButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIButtonView()
    }
}
