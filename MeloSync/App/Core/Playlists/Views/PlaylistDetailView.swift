//
//  PlaylistDetailView.swift
//  MeloSync
//
//  Created by santiago on 12/20/23.
//

import SwiftUI

struct PlaylistDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            ZStack(alignment:.topLeading) {
                
                PlaylistCarouselView()
                    .frame(height: 320)
                
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                })
            }
            
            PlaylistInfoView()
                .padding(.leading)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            Divider()
            // User's Info
            HStack {
                VStack(alignment: .leading) {
                    Text("This experience was curated by UserName")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                        .textCase(.uppercase)
                    
                }.padding(.leading)
                Spacer()
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 64, height: 64)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.trailing)
            }
            
            Divider()
            // Songs
            LazyVStack(alignment: .leading) {
                ForEach(0...3,  id: \.self) { song in
                    Button(action: {
                        // Open Album Details
                    }, label: {
                        SongInfoView(song: .initAppleMusic(title: "Example Song", artistName: "Artist Name", albumTitle: "Artist Name", duration: 10, artwork: nil))
                            .modifier(SongSwipeAction())
                    })
                    .foregroundStyle(.black)
                    
                }
                .padding(.vertical, -3)
            }
           
            
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 65)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                HStack {
                    SavePlaylistButton()
                }
                .padding(.horizontal, 32)
                
            }
            .background(.white)
        }
    }
}



#Preview {
    PlaylistDetailView()
}
