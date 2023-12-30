//
//  Review.swift
//  MeloSync
//
//  Created by santiago on 12/26/23.
//

import Foundation



struct Review: Codable {
    
    let user: User
    let score: Rating
    let description: String
    let playlist: Playlist
    
    
    
    
    enum Rating: Codable {
        case one
        case two
        case three
        case four
        case five
    }
    
}
