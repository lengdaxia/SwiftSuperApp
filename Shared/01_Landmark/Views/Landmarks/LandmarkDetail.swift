//
//  LandmarkDetail.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/02/08.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var appData: AppDataStore
    
    var landmark: LandMark
    
    var landmarkIndex: Int{
        appData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView{
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading){
                HStack{
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.green)
                    
                    Button(action:{
                        self.appData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }){
                        if self.appData.landmarks[self.landmarkIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                
                HStack{
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)").font(.title2)
                Text(landmark.description)

            }
            .padding()
            
            Spacer()
        }
        .navigationTitle(landmark.name)
        #if os(iOS)
//        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}


struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: AppDataStore().landmarks[3])
            .environmentObject(AppDataStore())
    }
}
