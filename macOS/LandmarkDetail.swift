//
//  LandmarkDetail.swift
//  SuperSwiftUIDemoApp (macOS)
//
//  Created by leng on 2021/02/09.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    
    @EnvironmentObject var appData: AppDataStore
    var landmark: LandMark
    var landmarkIndex: Int {
        appData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView{
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                MapView(coordinate: landmark.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 200)
                
                Button("Open in Maps"){
                    let desctination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                    desctination.name = landmark.name
                    desctination.openInMaps()
                }.padding()
            }
            
            
            VStack(alignment: .leading, spacing: 20) {
                
                HStack(spacing: 24) {
                    CircleImage(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)

                    VStack(alignment: .leading) {
                        HStack {
                            Text(landmark.name)
                                .font(.title)
                            FavoriteButton(isSet: $appData.landmarks[landmarkIndex].isFavorite)
                                .buttonStyle(PlainButtonStyle())
                        }

                        VStack(alignment: .leading) {
                            Text(landmark.park)
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                }
                
                Divider()
                
                Text("About\(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
              
            }.padding()
            .frame(maxWidth: 700)
            //        .offset(y: -50)
        }.navigationTitle(landmark.name)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let appData = AppDataStore()
        
        LandmarkDetail(landmark: appData.landmarks[0])
            .environmentObject(appData)
        
    }
}
