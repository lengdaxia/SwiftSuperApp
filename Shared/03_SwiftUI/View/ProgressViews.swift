//
//  ProgressView.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/02/17.
//

import SwiftUI

struct ProgressViews: View {
    var body: some View {
        ProgressView("Progress", value:38, total: 100)
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViews()
    }
}
