//
//  SwiftUIViewGallery.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/02/17.
//

import SwiftUI

struct SwiftUIViewGallery: View {
    private var sections:[[String:[String]]] = [
        ["View":["Text","TextField","Label","TextEditor","Image","Shape","ProgressView","Map","ColorPicker"]],
        ["Layout":["Background","VStack","HStack","VStack","ZStack","LazyVStack","LazyHStack","LazyVGrid","LazyHGrid"]],
        ["Input":["Toggle","Button","TextField","Slider","Date Picker","Stepper","Tap","Geusture","OnChange"]],
        ["Container":["NavigationView","TabView","Group"]],
        ["List":["List","Grid"]],
        ["Navigation":["Navigation"]]
    ]
    
    var body: some View {
        List{
            ForEach(0..<sections.count, id:\.self){ index in
                let dict = sections[index]
                let key = dict.keys.first!
                let values:[String] = dict[key]!
                
                Section(header: Text(key))
                {
                    ForEach(0..<values.count, id:\.self){ index in
                        let viewStr = values[index]
                        let destinationView = navigateTo(str: viewStr, innerView: nil)
                        
                        NavigationLink(destination: destinationView){
                            Text(values[index])
                        }
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("UI Gallery")
    }
    
    
    
    func navigateTo(str: String, innerView: AnyView? = nil) -> AnyView {
        switch str {
        case "Text":
            return AnyView(SwiftUITextView())
        case "TextField":
            return AnyView(SwiftUITextFieldView())
        case "Label":
            return AnyView(SwiftUILabelView())
        case "Image":
            return AnyView(ImageView())
        case "Shape":
            return AnyView(ShapeView())
        case "TextEditor":
            return AnyView(TextEditorView())
        case "ProgressView":
            return AnyView(ProgressViews())
        case "Map":
            return AnyView(MapViews())
        case "ColorPicker":
            return AnyView(ColorPickerView())
        case "Grid":
            return AnyView(SwiftUIGridView())
        default:
            return AnyView(innerView ?? AnyView(Text("View Not Found")))
        }
    }
}



struct SwiftUIViewGallery_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewGallery()
    }
}
