//
//  DeveloperPreview.swift
//  MeloSync
//
//  Created by santiago on 12/26/23.
//

import Foundation

class DeveloperPreview {
    var user1: User // Declare user1 as a property
    var user2: User
    
    var playlists: [Playlist] = []

    init() {
        self.user1 = User(id: NSUUID().uuidString, ownerName: "svntiiago", ownerImageUrl: "none", playlists: [], reviews: [])
        self.user2 = User(id: NSUUID().uuidString, ownerName: "loomzy", ownerImageUrl: "none", playlists: [], reviews: [])

        // Add Playlist using user1
        
        let playlist1 = Playlist(
            id: NSUUID().uuidString,
            playlistName: "Vibez Cartel",
            coverPhoto: URL(string: "https://www.example.com")!,
            description: "Get vibey",
            owner: user1,
            songs: [],
            reviews: []
        )
        
        let playlist2 = Playlist(
            id: NSUUID().uuidString,
            playlistName: "lonely-uzi",
            coverPhoto: URL(string: "https://www.example.com")!,
            description: "Uzi Da Goat",
            owner: user2,
            songs: [],
            reviews: []
        )

        self.playlists = [
            playlist1,
            playlist2
        ]
        
        self.user1.playlists = [playlist1]
        self.user2.playlists = [playlist2]

    }
}


