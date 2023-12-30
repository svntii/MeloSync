//
//  ProfileView.swift
//  MeloSync
//
//  Created by santiago on 12/24/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            // Profile Login View
            VStack(alignment: .leading, spacing: 32) {
                
                // Profile Login View
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile")
                        .fontWeight(.semibold)
                    .font(.largeTitle)
                    
                    Text("Log in to explore and share your musical pallete")
                }
                
                
                LogInButton()
                
                HStack {
                    Text("Don't have an account?")
                    Text("Sign-up")
                        .underline()
                        .fontWeight(.semibold)
                }
                .font(.caption)
                
            }
            
            // Options View
            VStack(spacing: 24) {
                ProfileOptionRowView(imageName: "Gear", title: "Settings")
                ProfileOptionRowView(imageName: "Gear", title: "Accessibility")                
            }
            .padding(.vertical)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}

struct LogInButton: View {
    var body: some View {
        Button(action: {}, label: {
            Text("Login")
                .foregroundStyle(.white)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 360, height: 48)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
    }
}
