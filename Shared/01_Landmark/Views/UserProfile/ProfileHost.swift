//
//  ProfileHost.swift
//  SuperSwiftUIDemoApp
//
//  Created by Marlon on 2021/2/8.
//

import SwiftUI

struct ProfileHost: View {

    @Environment(\.editMode) var editMode
    
    @State var profile = Profile.default
    @EnvironmentObject var appData: AppDataStore
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
            

                if editMode?.wrappedValue == .active{
                    Button("Cancel"){
                        profile = appData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            
            }
            
        
            if editMode?.wrappedValue == .inactive{
                ProfileSummary(profile: appData.profile)
            }else{
                ProfileEditor(profile: $profile)
                    .onAppear{
                        profile = appData.profile
                    }
                    .onDisappear{
                        appData.profile = profile
                    }
            }
            
            
     
        }.padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(AppDataStore())
    }
}
