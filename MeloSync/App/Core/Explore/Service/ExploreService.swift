//
//  ExploreService.swift
//  MeloSync
//
//  Created by santiago on 12/26/23.
//

import Foundation


class ExploreService {
    
    let dev: DeveloperPreview = DeveloperPreview()
    
    func fetchPlaylists() async throws -> [Playlist] {
        return dev.playlists
    }
    
    
}

