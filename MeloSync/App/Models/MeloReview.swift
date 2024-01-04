//
//  Review.swift
//  MeloSync
//
//  Created by santiago on 12/26/23.
//

import Foundation



struct MeloReview: Codable {
    
    let user: MeloUser
    let score: MeloRating
    let description: String
    let playlist: MeloPlaylist
    
    
    
    
    enum MeloRating: Codable {
        case one
        case two
        case three
        case four
        case five
    }
    
}
