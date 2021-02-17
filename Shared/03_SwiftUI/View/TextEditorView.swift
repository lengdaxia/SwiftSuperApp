//
//  TextEditorView.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/02/17.
//

import SwiftUI

struct TextEditorView: View {
    @State var currentStr: String = "current Str .."
    
    var body: some View {
        VStack(alignment: .center){
            TextEditor(text: $currentStr)
                .onChange(of: currentStr, perform: { value in
                    
                }).background(Color.gray)
                .lineSpacing(5)
            
        }.padding()
        .background(Color.gray)
          
        
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView()
    }
}
