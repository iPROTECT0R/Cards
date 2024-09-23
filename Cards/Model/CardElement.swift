// CardElement

// Created by Raymond Shelton on 9/15/24.

// This code defines a protocol for card elements and provides concrete implementations
// for image and text elements. Each element has an ID and transform properties,
// with functionality to retrieve its index within an array of elements.

import SwiftUI

protocol CardElement {
  var id: UUID { get } // Unique identifier for each element
  var transform: Transform { get set } // Transform properties for positioning and scaling
}

extension CardElement {
  // Function to find the index of the element in a given array
  func index(in array: [CardElement]) -> Int? {
    array.firstIndex { $0.id == id } // Return the index of the element with the matching ID
  }
}

struct ImageElement: CardElement {
  let id = UUID() // Unique identifier for the image element
  var transform = Transform() // Default transform properties
  var uiImage: UIImage? // Optional UIImage for the image element

  // Computed property to provide a SwiftUI Image
  var image: Image {
    Image(
      uiImage: uiImage ??
        UIImage(named: "error-image") ?? // Fallback to an error image if none is provided
        UIImage())
  }
}

struct TextElement: CardElement {
  let id = UUID() // Unique identifier for the text element
  var transform = Transform() // Default transform properties
  var text = "" // The text content of the element
  var textColor = Color.black // Default text color
  var textFont = "Gill Sans" // Default text font
}
