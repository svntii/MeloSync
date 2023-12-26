//
//  Platform.swift
//  MeloSync
//
//  Created by santiago on 12/26/23.
//

import Foundation


enum Platform: Int, Codable, Hashable, Identifiable {
    case spotify
    case appleMusic
    case youTube
    case local
    
    var id: Int { self.rawValue }
}

