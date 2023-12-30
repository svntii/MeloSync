//
//  HomeView.swift
//  MeloSync
//
//  Created by santiago on 12/24/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log-in to view your playlists")
                        .font(.headline)
                    
                    Text("You can create, view, or edit playlists once you're logged in")
                        .font(.footnote)
                }
                
                LogInButton()
                Spacer()
            }
            .padding()
            .navigationTitle("Playlists")
        }

    }
}

#Preview {
    HomeView()
}
