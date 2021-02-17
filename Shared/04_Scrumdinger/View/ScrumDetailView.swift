//
//  ScrumDetailView.swift
//  SuperSwiftUIDemoApp (iOS)
//
//  Created by leng on 2021/02/17.
//

import SwiftUI

struct ScrumDetailView: View {
    @Binding var model: DailyScrum
    @State private var data: DailyScrum.Data = DailyScrum.Data()
    @State private var isPresented = false
    
    var body: some View {
        List{
            Section(header: Text("Meeting Info")) {
                NavigationLink(
                    destination: MeetingView(),
                    label: {
                        Label("Start Meeting", systemImage:"timer")
                            .font(.headline)
                            .foregroundColor(.accentColor)
                            .accessibilityLabel(Text("Start meeting"))
                })
                HStack {
                        Label("Length", systemImage: "clock")
                            .accessibilityLabel(Text("Meeting length"))
                        Spacer()
                        Text("\(model.lengthInMinutes) minutes")
                    }
                HStack {
                        Label("Color", systemImage: "paintpalette")
                        Spacer()
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(model.color)
                    }
                    .accessibilityElement(children: .ignore)
                
            }
            Section(header: Text("Attendees")) {
                ForEach(model.attendees, id: \.self){ attendee in
                    Label(attendee, systemImage: "person")
                        .accessibilityLabel(Text("Person"))
                        .accessibilityValue(Text(attendee))
                }
            }
            
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(model.title)
        .navigationBarItems(trailing: Button("Edit"){
            isPresented = true
            data = model.data
            }
        ).fullScreenCover(isPresented: $isPresented) {
            NavigationView{
                ScrumEditView(model: $data)
                    .navigationTitle(model.title)
                    .navigationBarItems(leading: Button("Cancel"){
                        isPresented = false
                    },trailing: Button("Done"){
                        isPresented = false
                        model.update(from: data)
                    })
            }
        }
    }
}

struct ScrumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumDetailView(model: .constant(DailyScrum.data.first!))
    }
}
