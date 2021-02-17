//
//  ColorPickerView.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/02/11.
//

import SwiftUI

struct ColorPickerView: View {
    @State private var bgColor = Color.white

    var body: some View {
        VStack {
            ColorPicker("Set the background color", selection: $bgColor, supportsOpacity: false)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(bgColor)
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView()
    }
}
