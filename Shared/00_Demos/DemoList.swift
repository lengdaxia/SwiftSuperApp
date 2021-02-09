//
//  DemoList.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/02/08.
//

import SwiftUI

struct DemoList: View {
    
    var demoList: [DemoModel] = [
        DemoModel.init(name: "LandMarks", description: "LandMarks App"),
        DemoModel.init(name: "Drawing", description: "Drawing Paths and Shapes"),
        DemoModel.init(name: "Playground", description: "Playground"),
    ]
    
    var body: some View {
        NavigationView{
            List(demoList){ demo in
                NavigationLink(destination: DemoDetailView(demoModel: demo)){
                    DemoCell(demoModel: demo)
                }
            }
            .navigationTitle("DemoList")
        }.onOpenURL(perform: { url in
            print(url)
        })
//        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct DemoList_Previews: PreviewProvider {
    static var previews: some View {
        DemoList()
    }
}
