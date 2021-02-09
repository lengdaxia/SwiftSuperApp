//
//  LandmarkDetail.swift
//  WatchLandmarks Extension
//
//  Created by leng on 2021/02/09.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var appData: AppDataStore
    var landmark: LandMark
    var landmarkIndex: Int {
        appData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView{
            VStack{
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
                
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                
                Divider()
                
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(landmark.state)
                    .font(.caption)
                
                Divider()
                
                
                MapView(coordinate: landmark.locationCoordinate)
                    .scaledToFit()
                
            }.padding(16)
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let appData = AppDataStore()
        
        LandmarkDetail(landmark: appData.landmarks[0])
            .environmentObject(appData)
        
//            .previewDevice("Apple Watch Series 5 - 44mm")
        
//        LandmarkDetail(landmark: appData.landmarks[1])
//            .environmentObject(appData)
//            .previewDevice("Apple Watch Series 5 - 40mm")
    }
}
