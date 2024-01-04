//
//  MeloUser.swift
//  MeloSync
//
//  Created by santiago on 12/26/23.
//

import Foundation


struct MeloUser: Identifiable, Codable {
    let id: String
    let userName: String
    let firstName: String
    let lastName: String
    let profilePic: String
    let phoneNumber: String
    let email: String
    
    var playlists: [MeloPlaylist]
    var reviews: [MeloReview]
    
    
    
}
