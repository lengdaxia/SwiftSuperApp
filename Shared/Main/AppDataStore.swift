//
//  AppDataStore.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/02/08.
//

import Foundation

final class AppDataStore: ObservableObject{
    
//    intro app data
    @Published var showFavoritesOnly = false
    @Published var landmarks: [LandMark] = load("landmarkData.json")
    @Published var profile = Profile.default
    @Published var scrumData = ScrumData()

    var hikes: [Hike] = load("hikeData.json")

    var features:[LandMark]{
        landmarks.filter{
            $0.isFeatured
        }
    }
    
    
    var categories:[String:[LandMark]]{
        Dictionary(grouping: landmarks, by: {$0.category.rawValue})
    }
}


