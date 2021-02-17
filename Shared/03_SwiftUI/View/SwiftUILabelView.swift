//
//  SwiftUILabelView.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/02/11.
//

import SwiftUI

struct SwiftUILabelView: View {
    var body: some View {
        List{
            Group{
                Label("Hello Label", systemImage: "sun.min")
            }
            
            Label("Context Menu Label",systemImage: "sun.min")
                .foregroundColor(.blue)
                .font(.system(.title, design: .rounded))
                .contextMenu(ContextMenu(menuItems: {
                    Button(action: {
                        print("Action1")
                    }, label: {
                        Text("Action1")
                    })
                    Button(action: {
                        print("Action1")
                    }, label: {
                        Label("Action2", systemImage: "trash.fill")
                    })
                    Text("Menu Item 1")
                    /*@START_MENU_TOKEN@*/Text("Menu Item 2")/*@END_MENU_TOKEN@*/
                    /*@START_MENU_TOKEN@*/Text("Menu Item 3")/*@END_MENU_TOKEN@*/
                }))
        }
    }
}

struct SwiftUILabelView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUILabelView()
    }
}
