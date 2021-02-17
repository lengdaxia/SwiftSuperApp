//
//  CardView.swift
//  SuperSwiftUIDemoApp (iOS)
//
//  Created by leng on 2021/02/17.
//

import SwiftUI

struct CardView: View {
    let model: DailyScrum
    
    var body: some View{
        VStack(alignment:.leading){
            Text(model.title)
                .font(.headline)
            Spacer()
            HStack{
                Label("\(model.attendees.count)", systemImage: "person.3")
                Spacer()
                Label("\(model.lengthInMinutes)", systemImage:"clock")
                    .padding(.trailing, 20)
            }.font(.caption)
        }
        .padding()
        .foregroundColor(model.color.accessibleFontColor)
    }
    
  
}

struct CardView_Previews: PreviewProvider {
    static var model = DailyScrum.data[0]
    
    static var previews: some View{
        CardView(model: model)
            .background(model.color)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
