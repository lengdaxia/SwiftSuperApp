//
//  Profile.swift
//  SuperSwiftUIDemoApp
//
//  Created by Marlon on 2021/2/8.
//

import Foundation

struct Profile {
    
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "Marlon")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { self.rawValue }
    }
}
