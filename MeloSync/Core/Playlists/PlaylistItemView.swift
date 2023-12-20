//
//  PlaylistItemView.swift
//  MeloSync
//
//  Created by santiago on 12/20/23.
//

import SwiftUI

struct PlaylistItemView: View {
    var body: some View {
        VStack(spacing: 8) {
            // Cover Image
            TabView {
                ForEach(0...3, id: \.self) { image in
                    Rectangle()
                }
                .frame(height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .tabViewStyle(.page)
            }
            
            // Playlist Details
            HStack(alignment: .top) {
                // Details
                VStack(alignment: .leading) {
                    Text("Playlist Name")
                        .fontWeight(.semibold)
                    Text("Made by Name")
                        .foregroundStyle(.gray)
                    Text("# of Songs")
                        .foregroundStyle(.gray)
                    
                }
                
                Spacer()
                
                // Ratings
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("4.86")
                }
            }
            
        }.padding()
    }
}

#Preview {
    PlaylistItemView()
}
