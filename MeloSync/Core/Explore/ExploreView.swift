//
//  ExploreView.swift
//  MeloSync
//
//  Created by santiago on 12/20/23.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            VStack {
                SearchFilterBar()
                ScrollView {
                    LazyVStack(spacing: 32) {
                        ForEach(0...10, id: \.self) { listing in
                            PlaylistItemView()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
