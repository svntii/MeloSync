//
//  SongInfoView.swift
//  MeloSync
//
//  Created by santiago on 12/20/23.
//

import SwiftUI

struct SongInfoView: View {
    
    let song: MeloSong
    
    
    @State private var swipeState = SwipeState()
    @State private var showOptions = false

    let frame = 350
    
    init(song: MeloSong) {
            self.song = song
    }
    
    
    var body: some View {
        VStack {
            HStack {
    
                AsyncImage(url: song.appleMusicCoverArt?.url(width: frame, height: frame)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .interpolation(.high)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .clipShape(Rectangle())
                            .padding(.trailing, 4)
                    } else if phase.error != nil {
                        Image(systemName: "questionmark.diamond")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Rectangle())
                            .padding(.trailing, 4)
                    } else {
                        ProgressView()
                            .padding(.trailing, 4)
                    }
                }

                VStack(alignment: .leading, spacing: 5) {
                    Text(song.songName)
                        .font(.headline)
                        .lineLimit(1)
                    
                    Text(song.album ?? "Single")
                        .font(.subheadline)
                        .lineLimit(1)
                    
                        Text(song.artist)
                            .font(.subheadline)
                            .lineLimit(1)
                    HStack {
                        Text(song.formatTrackTime())
                            .font(.subheadline)
    
                        song.source.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
        
                Button(action: {
                    self.showOptions.toggle()
                }) {
                    Image(systemName: "ellipsis")
                }
                .foregroundColor(.black)
            }
            .padding()
            .background(song.source.color.opacity(0.1))
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(song.source.color, lineWidth: 0.5)
            )
        }
        .sheet(isPresented: $showOptions, content: {
            SongOptionsView(song: song)
        })
    }

}


#Preview {
    SongInfoView(song: .initAppleMusic(title: "Example Song Example SongExample Song", artistName: "Artist Name", albumTitle: "Artist Name", duration: 10, artwork: nil))
        .modifier(SongSwipeAction())

}
