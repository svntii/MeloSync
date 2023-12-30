//
//  PlaylistCarouselView.swift
//  MeloSync
//
//  Created by santiago on 12/20/23.
//

import SwiftUI

struct PlaylistCarouselView: View {
    var body: some View {
        TabView {
            ForEach(0...3, id: \.self) { image in
                Rectangle()
                // Image(image)
                //      .resizable()
                //      .scaledToFill()
            }
            
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    PlaylistCarouselView()
}
