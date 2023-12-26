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
    @State private var genre: Genre = .random
    @State private var mood: Moods = .random
    
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation(.snappy) {
                        show.toggle()
                    }
                }, label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                })
                Spacer()
                if !playlists.isEmpty || !song.isEmpty || !user.isEmpty || genre != .random || mood != .random {
                    Button("Clear"){
                        playlists = ""
                        song = ""
                        user = ""
                        genre = .random
                        mood = .random
                    }
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            // Song Search
            VStack {
                if selectedOption == PlaylistSearchOptions.Song {
                    ExpandedSongView(songName: $song)
                    
                } else {
                    CollapsedPickerView(title: "What", description: song)
                        .onTapGesture {
                            withAnimation(.bouncy) {
                                selectedOption = PlaylistSearchOptions.Song
                            }
                        }
                }
            }
            .padding()
            .frame(height: selectedOption == .Song ? 160 : 64)
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
                    CollapsedPickerView(title: "Who", description: "\(playlists) by \(user)")
                        .onTapGesture {
                            withAnimation(.bouncy) {
                                selectedOption = PlaylistSearchOptions.User
                            }
                        }
                }
            }
            .padding()
            .frame(height: selectedOption == .User ? 160 : 64)
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
                    ExpandedMoodView(selectedMood: $mood)
                } else {
                    CollapsedPickerView(title: "Mood", description: mood.rawValue, titleColor: .white)
                        .onTapGesture {
                            withAnimation(.bouncy) {
                                selectedOption = PlaylistSearchOptions.Mood
                            }
                        }
                        
                }
            }
            .background(mood.color)
            .padding()
            .background(mood.color)
            .frame(height: selectedOption == .Mood ? 160 : 64)
            .background(mood.color)
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .Mood}
            }
            
            
            // Genre Search
            VStack {
                if selectedOption == PlaylistSearchOptions.Genre {
                    ExpandedGenreView(selectedGenre: $genre)
                    
                } else {
                    CollapsedPickerView(title: "Genre", description: genre.rawValue)
                        .onTapGesture {
                            withAnimation(.bouncy) {
                                selectedOption = PlaylistSearchOptions.Genre
                            }
                        }
                }
            }
            .padding()
            .frame(height: selectedOption == .Genre ? 160 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .Genre}
            }
            
            Spacer()
        }        
        .overlay(alignment: .bottom) {
            VStack {
                HStack {
                    Button("Search") {
                        // Add action when the button is tapped
                        withAnimation(.snappy) {
                            show.toggle()
                        }
                    }
                    .foregroundStyle(.black)
                    .frame(width: 140, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.horizontal, 32)
                
            }
            .background(.white)
        }

    }
}

#Preview {
    PlaylistSearchView(show: .constant(false))
}

struct CollapsedPickerView: View {
    
    let title: String
    let description: String
    var titleColor: Color = .gray
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(titleColor)
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

                TextField("......... ?", text: $songName)
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
                
                TextField("playlist name", text: $playlists)
                    .font(.title2)
                    .underline()
            }
            HStack {
                Text("by")
                    .font(.title2)
                    .fontWeight(.semibold)
            
                TextField("user", text: $userName)
                    .font(.title2)
                    .underline()
            }
            
        }
    }
}

enum Moods: String, CaseIterable, Identifiable {
    case random = "Random"
    case happy = "Happy"
    case chill = "Chill"
    case feelz = "Feelz"
    case studious = "Studious"
    case jazzy = "Jazzy"
    case grunge = "Grunge"
    case alt = "Alt"
    
    var id: Moods { self }
    
    var color: Color {
        switch self {
            case .random: return .gray
            case .happy: return .yellow
            case .chill: return .blue
            case .feelz: return .purple
            case .studious: return .green
            case .jazzy: return .orange
            case .grunge: return .red
            case .alt: return .pink
        }
    }
}



struct ExpandedMoodView: View {
    @Binding var selectedMood: Moods

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("My mood is")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Picker("...", selection: $selectedMood) {
                    ForEach(Moods.allCases.sorted { $0.rawValue < $1.rawValue }, id: \.self) { mood in
                        Text(mood.rawValue)
                    }
                }
                .pickerStyle(.wheel)
            }
        }
    }
}



enum Genre: String, CaseIterable, Identifiable {
    case random = "Random"
    case pop = "Pop"
    case rock = "Rock"
    case hipHop = "Hip Hop"
    case jazz = "Jazz"
    case classical = "Classical"
    case electronic = "Electronic"
    case country = "Country"
    case alternative = "Alternative"
    case RB = "R&B"
    
    var id: Genre { self }
}


struct ExpandedGenreView: View {
    @Binding var selectedGenre: Genre

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("The genre is")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Picker("...", selection: $selectedGenre) {
                    ForEach(Genre.allCases.sorted { $0.rawValue < $1.rawValue }, id: \.self) { genre in
                        Text(genre.rawValue)
                    }
                }
                .pickerStyle(.wheel)
            }
        }
    }
}
