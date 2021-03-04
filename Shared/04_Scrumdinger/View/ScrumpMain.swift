//
//  ScrumpMain.swift
//  SuperSwiftUIDemoApp (iOS)
//
//  Created by leng on 2021/02/17.
//

import SwiftUI

struct ScrumpMain: View {
    @Binding var models: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    
    @State private var isPresented = false
    @State private var newScrumData = DailyScrum.Data()
    
    let saveAction: () -> Void
    
    var body: some View {
        List{
            ForEach(models){ model in
                NavigationLink(
                    destination: ScrumDetailView(model: model),
                    label:
                        {
                        CardView(model: model)
                        }).listRowBackground(model.color)
            }
            .onDelete { (indexSet) in
                models.remove(atOffsets: indexSet)
                saveAction()
            }
            
        }
        .padding()
        .navigationTitle("Daily Scrums")
        .navigationBarItems(trailing: Button(action:{
            isPresented = true
        }){
            Image(systemName: "plus")
        })
        .sheet(isPresented: $isPresented) {
            NavigationView{
                ScrumEditView(model: $newScrumData)
                    .navigationBarItems(leading: Button("Dismiss"){
                        isPresented = false
                    }, trailing: Button("Add"){
                        let newScrum = DailyScrum(title: newScrumData.title, attendees: newScrumData.attendees, lengthInMinutes: Int(newScrumData.lengthInMinutes), color: newScrumData.color)
                        
                        models.append(newScrum)
                        saveAction()
                        isPresented = false
                    })
            }
        }
        .onChange(of: scenePhase) { (phase) in
            if (phase == .inactive){
                saveAction()
            }
        }
    }
      
    private func binding(for scrum: DailyScrum) -> Binding<DailyScrum> {
            guard let scrumIndex = models.firstIndex(where: { $0.id == scrum.id }) else {
                fatalError("Can't find scrum in array")
            }
            return $models[scrumIndex]
        }}

struct ScrumpMain_Previews: PreviewProvider {
    static var previews: some View {
        
        ScrumpMain(models:.constant( AppDataStore().scrumData.scrums),saveAction: {})
    }
}
