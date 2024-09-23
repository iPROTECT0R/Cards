// CardThumbnail

// Created by Raymond Shelton on 9/15/24.

// This view represents a thumbnail for a card, displaying it as a rounded rectangle
// with a background color specified by the card's properties.

import SwiftUI

struct CardThumbnail: View {
  let card: Card // The card that this thumbnail represents

  var body: some View {
    RoundedRectangle(cornerRadius: 15) // Create a rounded rectangle shape
      .foregroundColor(card.backgroundColor) // Set the background color of the rectangle
      .frame(
        width: Settings.thumbnailSize.width, // Set the width from the settings
        height: Settings.thumbnailSize.height // Set the height from the settings
      )
  }
}

// Preview provider to show the CardThumbnail in the SwiftUI canvas
struct CardThumbnail_Previews: PreviewProvider {
  static var previews: some View {
    CardThumbnail(card: initialCards[0]) // Display the first card as a preview
  }
}
