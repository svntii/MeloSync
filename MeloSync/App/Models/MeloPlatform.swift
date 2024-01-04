//
//  MeloPlatform.swift
//  MeloSync
//
//  Created by santiago on 12/26/23.
//

import Foundation
import SwiftUI


enum MeloPlatform: Int, Codable, Hashable, Identifiable {
    case spotify
    case appleMusic
    case youTube
    case local
    
    var id: Int { self.rawValue }
    
    var color: Color {
        switch self {
        case .spotify:
            return Color.green
        case .appleMusic:
            return Color.red
        case .youTube:
            return Color.white
        case .local:
            return Color.blue
        }
    }
    
    var image: Image {
        switch self {
        case .spotify:
            return Image("SpotifyIcon")
        case .appleMusic:
            return Image("AppleMusicIcon")
        case .youTube:
            return Image("YouTubeIcon")
        case .local:
            return Image(systemName: "memorychip.fill")
        }
    }
}
