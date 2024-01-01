//
//  HomeView.swift
//  MeloSync
//
//  Created by santiago on 12/24/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var viewModel: AuthViewModel
    
    var body: some View {
        
        NavigationStack {
            
            if viewModel.userSession == nil {
                HomeNotLoggedInView()
            } else {
                Text("Logged In")
                    .task {
                        viewModel.signOut()
                    }
            
            }
            
        }

    }
}

#Preview {
    HomeView()
        .environmentObject(AuthViewModel())
}

struct HomeNotLoggedInView: View {
    
    @State private var isLoggingIn = false

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Log-in to view your playlists")
                    .font(.headline)
                
                Text("You can create, view, or edit playlists once you're logged in")
                    .font(.footnote)
            }
                
            LogInButton {
                isLoggingIn.toggle()
            }
            .navigationDestination(isPresented: $isLoggingIn) {
                    LoginView()
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Playlists")
    }
}
