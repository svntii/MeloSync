//
//  DeveloperPreview.swift
//  MeloSync
//
//  Created by santiago on 12/26/23.
//

import Foundation

class DeveloperPreview {
    var user1: MeloUser // Declare user1 as a property
    var user2: MeloUser
    
    var playlists: [Playlist] = []

    init() {
        self.user1 = MeloUser(id: NSUUID().uuidString, userName:  "svntiiago", firstName: "Santi", lastName: "Rodriguez", profilePic: "None", phoneNumber: "0111", email: "Santiago@Gmail.com", playlists: [], reviews: [])
        self.user2 = MeloUser(id: NSUUID().uuidString, userName:  "loomzy", firstName: "Xavi", lastName: "Rodriguez", profilePic: "None", phoneNumber: "02222", email: "Xavier@Gmail.com", playlists: [], reviews: [])
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


