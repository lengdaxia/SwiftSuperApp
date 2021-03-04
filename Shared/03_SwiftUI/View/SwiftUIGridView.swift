//
//  SwiftUIGridView.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/03/01.
//

import SwiftUI

struct SwiftUIGridView: View {
    var rows: [GridItem] =
            Array(repeating: .init(.fixed(20)), count: 2)
    
    var body: some View {
        Text("GridView")
            .font(.title)
        VStack{
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, alignment: .top) {
                    ForEach((0...79), id: \.self) {
                        let codepoint = $0 + 0x1f600
                        let codepointString = String(format: "%02X", codepoint)
                        Text("\(codepointString)")
                            .font(.footnote)
                        let emoji = String(Character(UnicodeScalar(codepoint)!))
                        Text("\(emoji)")
                            .font(.largeTitle)
                    }
                }
            }
        }
        
        Spacer()
    }
}

struct SwiftUIGridView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIGridView()
    }
}
