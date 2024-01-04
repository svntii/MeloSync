//
//  ExploreViewModel.swift
//  MeloSync
//
//  Created by santiago on 12/26/23.
//

import Foundation


class ExploreViewModel: ObservableObject {
    @Published var playlists = [MeloPlaylist]()
    
    private let service: ExploreService
    
    init(service: ExploreService) {
        self.service = service
    }
    
    func fetchPlaylists() async {
        do {
            self.playlists = try await service.fetchPlaylists()
        } catch {
            print("DEBUG")
        }
    }
    
}
