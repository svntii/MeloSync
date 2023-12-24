//
//  SongInfoView.swift
//  MeloSync
//
//  Created by santiago on 12/20/23.
//

import SwiftUI

struct SongInfoView: View {
    let songName: String
    let artist: String
    let album: String
    let time: String // Assuming time is a string for this example
    
    @State private var swipeState = SwipeState()
    @State private var showOptions = false


    
    init(
        songName: String = "Unknown Song",
        artist: String = "Unknown Artist",
        album: String = "Unknown Album",
        time: String = "0:00"){
            
        self.songName = songName
        self.artist = artist
        self.album = album
        self.time = time
    }
    
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "music.note.list")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .clipShape(Rectangle())
                    .padding(.trailing, 4)
                
                VStack(alignment: .leading) {
                    Text(songName)
                        .font(.headline)
                    
                    Text(album)
                        .font(.subheadline)
                    
                    Text(artist)
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Text(time)
                    .font(.subheadline)
                
                Button(action: {
                    self.showOptions.toggle()
                }) {
                    Image(systemName: "ellipsis")
                }
                .foregroundColor(.black)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
        }
        .sheet(isPresented: $showOptions, content: {
            SongOptionsView()
        })
    }
}


#Preview {
    SongInfoView(
        songName: "Example Song",
        artist: "Artist Name",
        album: "Album Name",
        time: "3:45"
    ).modifier(SongSwipeAction())
}
