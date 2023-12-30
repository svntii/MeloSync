//
//  SavePlaylistButton.swift
//  MeloSync
//
//  Created by santiago on 12/23/23.
//

import SwiftUI

struct SavePlaylistButton: View {
    @State private var isAnimating = false
    @State private var isFilled = false

    var body: some View {
        Button(action: {
            // Action for tapping the button normally
        }, label: {
            Text("Save Playlist")
                .foregroundStyle(.white)
                .font(.headline)
                .fontWeight(.semibold)
                .frame(width: 140, height: 40)
                .background(isFilled ? Color.purple : Color.red)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        })
        .scaleEffect(isAnimating ? 1.1 : 1.0)
        .animation(Animation.easeInOut(duration: 0.2).repeatCount(3, autoreverses: true), value: isAnimating)
        .gesture(LongPressGesture(minimumDuration: 1.0)
            .onChanged { _ in
                // Perform animation on button hold
                withAnimation {
                    isAnimating = true
                    isFilled = true
                }
                
                // Haptic feedback on hold
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.warning)
            }
            .onEnded { _ in
                // Reset animation when hold ends
                withAnimation {
                    isAnimating = false
                    isFilled = false
                }
            }
        )
        .frame(maxWidth: .infinity)
    }
}


#Preview {
    SavePlaylistButton()
}
