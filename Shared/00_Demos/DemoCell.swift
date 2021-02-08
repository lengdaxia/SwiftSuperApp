//
//  DemoCell.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/02/08.
//

import SwiftUI

struct DemoCell: View {
    
    var demoModel: DemoModel
    var body: some View {
        
        HStack{
            VStack(alignment: .leading){
                Text(demoModel.name)
                    .font(.title)
                Text(demoModel.description)
                    .font(.subheadline)
            }
            Spacer()
        }.padding(EdgeInsets(top: 2, leading: 12, bottom: 2, trailing: 12))

    }
}

struct DemoCell_Previews: PreviewProvider {
    static var previews: some View {
        DemoCell(demoModel: DemoModel(name: "Intro", description: "Intro App"))
            .previewLayout(.fixed(width: 300, height: 50))

    }
}
