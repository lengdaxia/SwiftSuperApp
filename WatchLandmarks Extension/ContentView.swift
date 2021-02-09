//
//  ContentView.swift
//  WatchLandmarks Extension
//
//  Created by Marlon on 2021/2/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppDataStore())
    }
}
