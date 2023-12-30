//
//  PlaylistInfoView.swift
//  MeloSync
//
//  Created by santiago on 12/20/23.
//

import SwiftUI

struct PlaylistInfoView: View {
    var body: some View {
        VStack(alignment:.leading ) {
            Text("Playlist Name")
                .font(.title)
                .fontWeight(.semibold)
            
            VStack(alignment: .leading) {
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("4.86")
                    Text(" - ")
                    Text("28 Reviews")
                        .underline()
                        .fontWeight(.semibold)
                    
                }
                .foregroundStyle(.black)
                
             Text("Genre - Length")
            }.font(.caption)
        }
    }
}

#Preview {
    PlaylistInfoView()
}
