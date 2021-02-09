//
//  PageView.swift
//  SuperSwiftUIDemoApp (iOS)
//
//  Created by leng on 2021/02/09.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .padding(.trailing)
                .frame(width: CGFloat(18 * pages.count))
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: AppDataStore().features.map {
                FeaturedCard(landmark: $0) })
            .aspectRatio(/*@START_MENU_TOKEN@*/1.5/*@END_MENU_TOKEN@*/, contentMode: .fit)
    }
}
