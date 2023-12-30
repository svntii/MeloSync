//
//  User.swift
//  MeloSync
//
//  Created by santiago on 12/26/23.
//

import Foundation


struct User: Identifiable, Codable {
    let id: String
    let ownerName: String
    let ownerImageUrl: String
    
    var playlists: [Playlist]
    var reviews: [Review]
    
    
    
}
