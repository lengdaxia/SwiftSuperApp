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
    
//    
}


