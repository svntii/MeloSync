//
//  SongOptionsView.swift
//  MeloSync
//
//  Created by santiago on 12/23/23.
//

import SwiftUI

struct SongOptionsView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "lightbulb.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 225)
            
            
            VStack(alignment: .leading, spacing: 20) {
                Button(action: {
                    // Action for "Favorite"
                }) {
                    HStack{
                        Image(systemName: "heart")
                            .padding(.trailing, 5)
                            .frame(width: 10, height: 10)
                        Text("Favorite")
                            .padding(.leading, 0)

                            
                    }
                    .foregroundStyle(.black)
                }
                Divider()
                Button(action: {
                    // Action for "Go to Album"
                }) {
                    HStack {
                        Image(systemName: "info.circle")
                            .padding(.trailing, 5)
                            .frame(width: 10, height: 10)
                        Text("View Credits")
                            .padding(.leading, 0)

                    }
                    .foregroundStyle(.black)
                }
                Button(action: {
                    // Action for "Go to Album"
                }) {
                    
                    HStack {
                        Image(systemName: "music.note")
                            .padding(.trailing, 5)
                            .frame(width: 10, height: 10)
                        Text("Go to Album")
                            .padding(.leading, 0)

                    }
                    .foregroundStyle(.black)
                }
                
                Button(action: {
                    // Action for "Go to Album"
                }) {
                    
                    HStack {
                        Image(systemName: "person")
                            .padding(.trailing, 5)
                            .frame(width: 10, height: 10)
                        Text("Go to Artist")
                            .padding(.leading, 0)

                    }
                    .foregroundStyle(.black)
                }
                
                
                Divider()
                
                Button(action: {
                    // Action for "Add to Playlist"
                }) {
                    HStack {
                        Image(systemName: "text.badge.plus")
                            .padding(.trailing, 5)
                            .frame(width: 10, height: 10)
                        Text("Add to a Playlist")
                            .padding(.leading, 0)
                    }
                    .foregroundStyle(.black)

                }
                
                Button(action: {
                    // Action for "Add to Library"
                }) {
                    HStack {
                        Image(systemName: "plus")
                            .padding(.trailing, 5)
                            .frame(width: 10, height: 10)
                        Text("Add to Library")
                            .padding(.leading, 0)
                    }
                    .foregroundStyle(.black)

                }
                
            }
            .padding()
        }
    }
}

#Preview {
    SongOptionsView()
}
