//
//  AddLandmarkView.swift
//  SuperSwiftUIDemoApp (macOS)
//
//  Created by leng on 2021/02/16.
//

import SwiftUI

struct AddLandmarkView: View {
    @Binding var isPresented: Bool

    @State private var username: String = ""
    @State private var isEditing = false
    
    @State private var fullText: String = "This is some editable text..."
    @State private var vibrateOnRing = false
    
    @State private var speed = 50.0
    @State private var isSliderEditing = false
    
    enum Flavor: String, CaseIterable, Identifiable {
        case chocolate
        case vanilla
        case strawberry

        var id: String { self.rawValue }
    }
    
    @State private var selectedFlavor = Flavor.chocolate
    
    
    @State private var bgColor =
            Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)

    
    
    var body: some View {
        VStack(alignment:.leading){
            
            Group(){
                Text("add new landmark")
                    .font(.largeTitle)
                    .padding()
                Divider()
                Toggle(isOn: $vibrateOnRing) {
                        Text("Vibrate on Ring")
                }.toggleStyle(SwitchToggleStyle())
                
                HStack{
                    Picker("Flavor", selection: $selectedFlavor) {
                        Text("Chocolate").tag(Flavor.chocolate)
                        Text("Vanilla").tag(Flavor.vanilla)
                        Text("Strawberry").tag(Flavor.strawberry)
                    }
                    Text("Selected flavor: \(selectedFlavor.rawValue)")
                }
                
                ColorPicker("Alignment Guides", selection: $bgColor)
            }

            
            TextField(
                    "User name (email address)",
                     text: $username
                ) { isEditing in
                    self.isEditing = isEditing
                } onCommit: {
                    print("onCommit: \(username)")
                }
                .disableAutocorrection(true)
            .border(Color.gray)
                Text(username)
                    .foregroundColor(isEditing ? .red : .blue)
            
            Divider()
            
//            TextEditor(text: $fullText)
//                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            
            Link("View Our Terms of Service",
                  destination: URL(string: "https://www.example.com/TOS.html")!)
            
            Group{
                Slider(
                      value: $speed,
                      in: 0...100,
                      onEditingChanged: { editing in
                          isSliderEditing = editing
                      }
                  )
                  Text("\(speed)")
                      .foregroundColor(isSliderEditing ? .red : .blue)
                
           
            }
            
            
            
            Button(action:  {
                withAnimation(){
                    isPresented = false
                }
            }, label: {
                Text("Close")
                    .font(.title)
                    .foregroundColor(Color.red)
                    
            })
        }.padding().frame(minWidth: 500, minHeight: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.clear)
    }
}

//struct AddLandmarkView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddLandmarkView()
//    }
//}
