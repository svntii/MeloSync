//
//  ExploreView.swift
//  MeloSync
//
//  Created by santiago on 12/20/23.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var showPlaylistSearchView = false
    
    var body: some View {
        NavigationStack {
            if showPlaylistSearchView {
                PlaylistSearchView(show: $showPlaylistSearchView)
            } else {
                VStack {
                    SearchFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showPlaylistSearchView.toggle()
                            }
                        }
                    ScrollView {
                        LazyVStack(spacing: 32) {
                            ForEach(0 ... 10, id: \.self) { playlist in
                                NavigationLink(value: playlist) {
                                    PlaylistItemView()
                                        .frame(height: 400)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                }
                            }
                        }
                    }
                    .navigationDestination(for: Int.self) { playlist in
                        PlaylistDetailView()
                            .navigationBarBackButtonHidden()
                    }
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
