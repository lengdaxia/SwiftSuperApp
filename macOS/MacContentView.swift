//
//  MacContentView.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/02/09.
//

import SwiftUI

struct MacContentView: View {
    var body: some View {
        MacLandmarkList()
            .frame(minWidth: 700, minHeight: 300)
            
    }
}

struct MacContentView_Previews: PreviewProvider {
    static var previews: some View {
        MacContentView()
            .environmentObject(AppDataStore())
    }
}
