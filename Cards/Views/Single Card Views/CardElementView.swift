// CardElementView

// Created by Raymond Shelton on 9/15/24.

// This set of views handles the display of different types of card elements, including images and text.
// It determines the type of element and delegates rendering to the appropriate view.

import SwiftUI

struct CardElementView: View {
  let element: CardElement // The card element to display

  var body: some View {
    // Check the type of element and render the appropriate view
    if let element = element as? ImageElement {
      ImageElementView(element: element) // Render an image element
    }
    if let element = element as? TextElement {
      TextElementView(element: element) // Render a text element
    }
  }
}

struct ImageElementView: View {
  let element: ImageElement // The image element to display

  var body: some View {
    element.image
      .resizable() // Make the image resizable
      .aspectRatio(contentMode: .fit) // Maintain aspect ratio
  }
}

struct TextElementView: View {
  let element: TextElement // The text element to display

  var body: some View {
    // Only display text if it's not empty
    if !element.text.isEmpty {
      Text(element.text) // Display the text
        .font(.custom(element.textFont, size: 200)) // Use a custom font and size
        .foregroundColor(element.textColor) // Set the text color
        .scalableText() // Apply any scalable text modifiers
    }
  }
}

// Preview provider to display the CardElementView in the SwiftUI canvas
struct CardElementView_Previews: PreviewProvider {
  static var previews: some View {
    CardElementView(element: initialElements[0]) // Preview with an initial element
  }
}
