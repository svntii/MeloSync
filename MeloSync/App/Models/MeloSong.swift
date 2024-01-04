//
//  MeloSong.swift
//  MeloSync
//
//  Created by santiago on 12/25/23.
//

import Foundation
import MusicKit




struct MeloSong: Identifiable, Codable, Hashable {
    let id: String
    let songName: String
    let artist: String
    let album: String?
    let trackTime: Double?
    let source: MeloPlatform
    
    
    let appleMusicCoverArt: Artwork?
    
    private init(id: String, songName: String, artist: String, album: String?, trackTime: Double?, source: MeloPlatform, appleMusicCoverArt: Artwork?) {
        self.id = id
        self.songName = songName
        self.artist = artist
        self.album = album
        self.trackTime = trackTime
        self.source = source
        self.appleMusicCoverArt = appleMusicCoverArt
    }
    
    static func initAppleMusic(title songName: String, artistName: String, albumTitle albumName: String, duration trackTime: Double?, artwork coverArt: Artwork?) -> MeloSong {
       return MeloSong(
        id: "",
        songName: songName,
        artist: artistName,
        album: albumName,
        trackTime: trackTime,
        source: .appleMusic,
        appleMusicCoverArt: coverArt
       )
    }
    
    func formatTrackTime() -> String {
        guard let trackTime = trackTime else {
            return "00:00" // Return default if trackTime is nil
        }
        
        let minutes = Int(trackTime) / 60
        let seconds = Int(trackTime) % 60
        
        return String(format: "%02d:%02d", minutes, seconds)
    }
}


