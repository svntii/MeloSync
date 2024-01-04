//
//  SongSwipeAction.swift
//  MeloSync
//
//  Created by santiago on 12/21/23.
//

import SwiftUI

struct SwipeState {
    var translation: CGSize = .zero
}

struct SongSwipeAction: ViewModifier {
    @State private var translation: CGSize = .zero
    @State private var showOptions: Bool = false
    var minimumSwipeThreshold: CGFloat = 200
    
    func body(content: Content) -> some View {
        content
            .offset(x: translation.width)
            .overlay(
                HStack {
                    Spacer()
                    if showOptions {
                        // Show options when `showOptions` is true
                        Text("Adding to Library")
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                            .offset(x: -20) // Adjust the offset as needed
                    }
                }
            )
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.translation = value.translation
                        if value.translation.width < -self.minimumSwipeThreshold {
                            // Swiped left - Perform action for left swipe
                            self.showOptions = true
                        } else {
                            self.showOptions = false
                        }
                    }
                    .onEnded { value in
                        if value.translation.width < -self.minimumSwipeThreshold {
                            // Swiped left - Perform action for left swipe
                            print("Swiped left")
                            // Perform additional actions here for left swipe
                        }
                        withAnimation {
                            self.translation = .zero // Reset translation
                            self.showOptions = false // Hide options after reset
                        }
                    }
            )
    }
}

extension View {
    func songSwipeAction() -> some View {
        modifier(SongSwipeAction())
    }
}



#Preview {
    SongInfoView(song: .initAppleMusic(title: "Example Song", artistName: "Artist Name", albumTitle: "Artist Name", duration: 10, artwork: nil))
        .modifier(SongSwipeAction())
}
