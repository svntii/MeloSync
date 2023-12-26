//
//  Album.swift
//  MeloSync
//
//  Created by santiago on 12/26/23.
//

import Foundation

struct Album: Codable {
    let albumCoverUrl: URL
    let artist: String
    let songs: [Song]
}
