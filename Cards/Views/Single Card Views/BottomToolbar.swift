// BottomToolbar

// Created by Raymond Shelton on 9/15/24.

// These views create a customizable bottom toolbar with buttons for different modal options.
// Each button displays an icon and text based on the selected modal type.

import SwiftUI

struct ToolbarButton: View {
  let modal: ToolbarSelection // The modal associated with this button
  private let modalButton: [
    ToolbarSelection: (text: String, imageName: String) // Mapping of modal types to their display properties
  ] = [
    .photoModal: ("Photos", "photo"),
    .frameModal: ("Frames", "square.on.circle"),
    .stickerModal: ("Stickers", "heart.circle"),
    .textModal: ("Text", "textformat")
  ]

  var body: some View {
    if let text = modalButton[modal]?.text,
       let imageName = modalButton[modal]?.imageName {
      VStack {
        Image(systemName: imageName) // Display the icon for the modal
          .font(.largeTitle)
        Text(text) // Display the text for the modal
      }
      .padding(.top)
    }
  }
}

struct BottomToolbar: View {
  @Binding var modal: ToolbarSelection? // Binding to the currently selected modal

  var body: some View {
    HStack {
      // Create a button for each possible toolbar selection
      ForEach(ToolbarSelection.allCases) { selection in
        Button {
          modal = selection // Set the selected modal when the button is pressed
        } label: {
          ToolbarButton(modal: selection) // Show the toolbar button for this selection
        }
      }
    }
  }
}

// Preview provider to display the BottomToolbar in the SwiftUI canvas
struct BottomToolbar_Previews: PreviewProvider {
  static var previews: some View {
    BottomToolbar(modal: .constant(.stickerModal)) // Preview with the sticker modal selected
      .padding()
  }
}
