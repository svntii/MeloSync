//
//  SongSearchResultsView.swift
//  MeloSync
//
//  Created by santiago on 1/4/24.
//

import SwiftUI

struct SongSearchResultsView: View {
    
    @Binding var songName: String
    
    let musicService = ExploreService()
    @State var results = [MeloSong]()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(results, id: \.self){ songResult in
                    NavigationLink(value: songResult){
                        SongInfoView(song: songResult)
                    }
                }
            }
        }.onAppear(perform: {
            Task {
                var appleMusicSongs = await musicService.appleMusicSearchSongs(str:songName)
                results.append(contentsOf: appleMusicSongs)
            }
        })
    }
}

//#Preview {
//    SongSearchResultsView()
//    
//
//}
