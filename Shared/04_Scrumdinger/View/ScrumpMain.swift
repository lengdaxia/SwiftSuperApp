//
//  ScrumpMain.swift
//  SuperSwiftUIDemoApp (iOS)
//
//  Created by leng on 2021/02/17.
//

import SwiftUI

struct ScrumpMain: View {
    @Binding var models: [DailyScrum]
    
    var body: some View {
        List{
            ForEach(models){ model in
                NavigationLink(
                    destination: ScrumDetailView(model: binding(for: model)),
                    label:
                        {
                        CardView(model: model)
                        }).listRowBackground(model.color)
            
            }
        }
        .padding()
        .navigationTitle("Daily Scrums")
        .navigationBarItems(trailing: Button(action:{}){
            Image(systemName: "plus")
        })
    }
    
    private func binding(for scrum: DailyScrum) -> Binding<DailyScrum> {
            guard let scrumIndex = models.firstIndex(where: { $0.id == scrum.id }) else {
                fatalError("Can't find scrum in array")
            }
            return $models[scrumIndex]
        }}

struct ScrumpMain_Previews: PreviewProvider {
    static var previews: some View {
        
        ScrumpMain(models:.constant( DailyScrum.data))
    }
}
