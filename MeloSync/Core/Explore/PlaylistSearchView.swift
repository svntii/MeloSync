//
//  PlaylistSearchView.swift
//  MeloSync
//
//  Created by santiago on 12/24/23.
//

import SwiftUI

enum PlaylistSearchOptions {
    case Mood
    case User
    case Genre
    case Song
    case Name
}

struct PlaylistSearchView: View {
    
    @Binding var show: Bool
    @State private var playlists = ""
    @State private var song = ""
    @State private var user = ""
    @State private var selectedOption: PlaylistSearchOptions = PlaylistSearchOptions.Song
    @State private var genre = ""
    @State private var mood = ""
    
    var body: some View {
        VStack {
            
            Button(action: {
                withAnimation(.snappy) {
                    show.toggle()
                }
            }, label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            })
            
            // Song Search
            VStack {
                if selectedOption == PlaylistSearchOptions.Song {
                    ExpandedSongView(songName: $song)
                    
                } else {
                    CollapsedPickerView(title: "Song Name", description: song)
                        .onTapGesture {
                            withAnimation(.bouncy) {
                                selectedOption = PlaylistSearchOptions.Song
                            }
                        }
                }
            }
            .padding()
            .frame(height: selectedOption == .Song ? 100 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                withAnimation(.bouncy) {selectedOption = .Song}
            }
            
            
            // User Name + playlist Search
            VStack {
                if selectedOption == PlaylistSearchOptions.User {
                    ExpandedUserView(playlists: $playlists, userName: $user)
                    
                } else {
                    CollapsedPickerView(title: "User", description: "Add Dates")
                        .onTapGesture {
                            withAnimation(.bouncy) {
                                selectedOption = PlaylistSearchOptions.User
                            }
                        }
                }
            }
            .padding()
            .frame(height: selectedOption == .User ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                withAnimation(.bouncy) {selectedOption = .User}
            }
            
            
            // Mood Search
            VStack {
                if selectedOption == PlaylistSearchOptions.Mood {
                    ExpandedMoodView(mood: $mood)
                } else {
                    CollapsedPickerView(title: "Mood", description: mood)
                        .onTapGesture {
                            withAnimation(.bouncy) {
                                selectedOption = PlaylistSearchOptions.Mood
                            }
                        }
                }
            }
            .padding()
            .frame(height: selectedOption == .Mood ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .Mood}
            }
            
            // Genre Search
            VStack {
                if selectedOption == PlaylistSearchOptions.Genre {
                    
                } else {
                    CollapsedPickerView(title: "Genre", description: genre)
                        .onTapGesture {
                            withAnimation(.bouncy) {
                                selectedOption = PlaylistSearchOptions.Genre
                            }
                        }
                }
            }
            .padding()
            .frame(height: selectedOption == .Genre ? 150 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .Genre}
            }
        
    
        }
    }
}

#Preview {
    PlaylistSearchView(show: .constant(false))
}

struct CollapsedPickerView: View {
    
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
        }
  
    }
}

struct ExpandedSongView: View {
    
    @Binding var songName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Song name is")
                    .font(.title2)
                    .fontWeight(.semibold)

                TextField("?", text: $songName)
                    .font(.title2)
                    .underline()
            }
        }
    }
}


struct ExpandedUserView: View {
    
    @Binding var playlists: String
    @Binding var userName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Listen to")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                TextField("?", text: $playlists)
                    .font(.title2)
                    .underline()
            }
            HStack {
                Text("by")
                    .font(.title2)
                    .fontWeight(.semibold)
            
                TextField("...", text: $userName)
                    .font(.subheadline)
                    .underline()
            }
            
        }
    }
}

struct ExpandedMoodView: View {
    
    @Binding var mood: String
    
    var body: some View {
        VStack {
            HStack {
                Text("My mood is")
                    .font(.title2)
                    .fontWeight(.semibold)
                TextField("...", text: $mood)
                    .underline()
                    .font(.title2)
                
            }
        }
    }
}
