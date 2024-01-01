//
//  Playlist.swift
//  MeloSync
//
//  Created by santiago on 12/25/23.
//

import Foundation

struct Playlist: Identifiable, Codable {
    
    let id: String
    var playlistName: String
    let coverPhoto: URL
    var description: String
    let owner: MeloUser
    var songs: [Song]
    var reviews: [Review]
    
}
