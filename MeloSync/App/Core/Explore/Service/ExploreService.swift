//
//  ExploreService.swift
//  MeloSync
//
//  Created by santiago on 12/26/23.
//

import Foundation
import MusicKit

class ExploreService {
    
    let dev: DeveloperPreview = DeveloperPreview()
    
    let AMService = AppleMusicService()
    
    func fetchPlaylists() async throws -> [MeloPlaylist] {
        return dev.playlists
    }
    
    func searchSongs(songName name: String) {
        
        
        
    }
    
    func appleMusicSearchSongs(str: String) async -> [MeloSong] {
        return await AMService.searchSongs(songName: str)
    }
    
    func spotifySearchSongs() {}
    
    
}

protocol MusicService {
    func searchSongs(songName name: String) async -> [MeloSong]
}


//class SpotifyService: MusicService {
//    func searchSongs(songName name: String) async -> [MeloSong] {
//        return []
//    }
//}

class AppleMusicService: MusicService {

    func searchSongs(songName name: String) async -> [MeloSong] {
        var request: MusicCatalogSearchRequest = .init(term: name, types: [Song.self])
        
        request.includeTopResults = true
        request.limit = 8

        do {
            let response = try await request.response()
            // Process the response and convert it to [Song]
            let responseSongs = response.songs // Assuming the response contains songs
            
            let songs = responseSongs.map { song in
                let item: MeloSong = .initAppleMusic(
                    title: song.title,
                    artistName: song.artistName,
                    albumTitle: song.albumTitle ?? "Single",
                    duration: song.duration,
                    artwork: song.artwork
                )
                
                return item // If song is already of type Song
              }
            return songs
    
        } catch {
            print("ERROR: Issue with searching for Song via Apple Music - \(error.localizedDescription)")
        }
        return []
    }
    
    func searchGenre(genre: String) {
        var request: MusicCatalogSearchRequest = .init(term: genre, types: [])
    }
    
}
