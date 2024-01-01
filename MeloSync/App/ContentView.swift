//
//  ContentView.swift
//  MeloSync
//
//  Created by santiago on 12/20/23.
//

import SwiftUI
import MusicKit


struct ContentView: View {
    @State private var isAuthorized = MusicAuthorization.currentStatus
    
    
    var body: some View {
        VStack {
            MainTabView()
        }.task {
            if MusicAuthorization.currentStatus != .authorized {
                isAuthorized = await MusicAuthorization.request()
            }
        }
    }
}

#Preview {
    ContentView().environmentObject(AuthViewModel())
}
