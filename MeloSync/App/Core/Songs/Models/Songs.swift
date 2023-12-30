//
//  Song.swift
//  MeloSync
//
//  Created by santiago on 12/25/23.
//

import Foundation



struct Song: Identifiable, Codable {
    let id: String
    let songName: String
    let artist: String
    let album: Album
    let trackTime: String
    let source: Platform
    
    
}
