//
//  ScrumEditView.swift
//  SuperSwiftUIDemoApp (iOS)
//
//  Created by leng on 2021/02/17.
//

import SwiftUI

struct ScrumEditView: View {
    @Binding var model: DailyScrum.Data
    @State private var newAttendee = ""
    
    
    var body: some View {
        List{
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $model.title)
                HStack{
                    Slider(value: $model.lengthInMinutes, in: 5...30, step: 1.0){
                        Text("Length")
                    }
                    .accessibilityValue(Text("\(Int(model.lengthInMinutes)) m"))
                    
                    Spacer()
                    Text("\(Int(model.lengthInMinutes)) m")
                        .accessibilityHidden(true)
                }
                
                ColorPicker("Color",selection: $model.color)
                    .accessibilityLabel(Text("Color Picker"))
            }
            
            Section(header: Text("Attendees")) {
                ForEach(model.attendees, id: \.self){ attendee in
                    Text(attendee)
                }.onDelete { indices in
                    model.attendees.remove(atOffsets: indices)
                }
                
                HStack{
                    TextField("New Attendee",text: $newAttendee)
                    Button(action: {
                        withAnimation {
                            model.attendees.append(newAttendee)
                            newAttendee = ""
                        }
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    }).disabled(newAttendee.isEmpty)
                }
            }
            
        }.listStyle(InsetGroupedListStyle())
    }
}

struct ScrumEditView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumEditView(model: .constant(DailyScrum.data.first!.data))
    }
}
