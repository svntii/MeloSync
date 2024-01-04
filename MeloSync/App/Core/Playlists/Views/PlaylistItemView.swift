//
//  PlaylistItemView.swift
//  MeloSync
//
//  Created by santiago on 12/20/23.
//

import SwiftUI

struct PlaylistItemView: View {
    
    @Environment(\.colorScheme) var colorScheme

    
    var body: some View {
        VStack(spacing: 8) {
            // Cover Image
            PlaylistCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            // Playlist Details
            HStack(alignment: .top) {
                // Details
                VStack(alignment: .leading) {
                    Text("Playlist Name")
                        .fontWeight(.semibold)
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
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
                }.foregroundStyle(.black)
            }
            
        }.padding()
    }
}

#Preview {
    PlaylistItemView()
        .environment(\.colorScheme, .dark)
}
