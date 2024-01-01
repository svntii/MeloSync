//
//  MainTabView.swift
//  MeloSync
//
//  Created by santiago on 12/24/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
            HomeView()
                .tabItem { Label("Home", systemImage: "house.fill") }
            ProfileView()
                .tabItem { Label("Explore", systemImage: "person") }

        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(AuthViewModel())
}
