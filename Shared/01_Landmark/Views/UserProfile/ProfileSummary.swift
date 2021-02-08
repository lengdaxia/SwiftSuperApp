//
//  ProfileSummary.swift
//  SuperSwiftUIDemoApp
//
//  Created by Marlon on 2021/2/8.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var appData: AppDataStore
    var profile : Profile
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10){
                Text(profile.username)
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                Text("Notification: \(profile.prefersNotifications ? "On" : "Off") ")
                
                Text("Seasonal Phptos: \(profile.seasonalPhoto.rawValue)")
                
                Text("Goal Date: ") + Text(profile.goalDate,style: .date)
                
                Divider()
                
                
            }
            .padding()
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        
        ProfileSummary(profile: Profile.default)
            .environmentObject(AppDataStore())
    }
}
