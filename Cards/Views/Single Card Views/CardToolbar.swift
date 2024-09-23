// CardToolbar

// Created by Raymond Shelton on 9/15/24.

// This view modifier adds a toolbar to the card detail view, including a "Done" button
// and a bottom toolbar for selecting different modal options. It also handles presenting
// modals based on the current selection.

import SwiftUI

struct CardToolbar: ViewModifier {
  @Environment(\.dismiss) var dismiss // Environment variable to dismiss the view
  @Binding var currentModal: ToolbarSelection? // Binding to the currently selected modal
  @Binding var card: Card // Binding to the card being modified
  @State private var stickerImage: UIImage? // State to hold the sticker image

  func body(content: Content) -> some View {
    content
      .toolbar {
        // Add a "Done" button to the navigation bar
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") {
            dismiss() // Dismiss the view when pressed
          }
        }
        // Add the BottomToolbar to the bottom of the view
        ToolbarItem(placement: .bottomBar) {
          BottomToolbar(modal: $currentModal)
        }
      }
      .sheet(item: $currentModal) { item in
        // Present a sheet based on the current modal selection
        switch item {
        case .stickerModal:
          // Show the StickerModal and handle image selection
          StickerModal(stickerImage: $stickerImage)
            .onDisappear {
              if let stickerImage = stickerImage {
                card.addElement(uiImage: stickerImage) // Add the selected sticker to the card
              }
              stickerImage = nil // Reset the sticker image
            }
        default:
          Text(String(describing: item)) // Display the modal type as text for other cases
        }
      }
  }
}
