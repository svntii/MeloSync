//
//  PlaylistSearchFilterBar.swift
//  MeloSync
//
//  Created by santiago on 12/20/23.
//

import SwiftUI

struct PlaylistSearchFilterBar: View {
    
    
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading, spacing: 2) {
                Text("What are others listening to?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("Any Mood - Any Body - Any Rating")
                    .font(.caption2)
                    .foregroundStyle(.gray)
                
            }
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay{
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.4), radius: 2)
        }
        .padding()
    }
}

#Preview {
    PlaylistSearchFilterBar()
}
