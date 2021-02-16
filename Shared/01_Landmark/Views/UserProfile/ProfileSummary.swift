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
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading, spacing: 10){
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notification: \(profile.prefersNotifications ? "On" : "Off") ")
                
                Text("Seasonal Phptos: \(profile.seasonalPhoto.rawValue)")
                
                Text("Goal Date: ") + Text(profile.goalDate,style: .date)
                
                Divider()
                VStack(alignment: .leading){
                    Text("Completd Badges")
                        .font(.headline)
                    
                    ScrollView{
                        HStack{
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }.padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading){
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: appData.hikes[0]).padding()
                }
                
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
