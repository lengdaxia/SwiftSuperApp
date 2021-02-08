//
//  DemoDetailView.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/02/08.
//

import SwiftUI

struct DemoDetailView: View {
    var demoModel: DemoModel
    var body: some View {
        VStack{
            containedView()
        }
    }
    
    func containedView() -> AnyView {
        switch demoModel.name {
        case "LandMarks":
            
            return AnyView(CategoryHome())
        case "Drawing":
            return AnyView(Badge())
        default:
            return AnyView(Text("Not found yet"))
        
        }
    }
}

struct DemoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DemoDetailView(demoModel: DemoModel(name: "LandMarks", description: "Intro App"))
    }
}
