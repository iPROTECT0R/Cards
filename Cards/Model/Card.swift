// Card

// Created by Raymond Shelton on 9/15/24.

// This struct represents a card with a unique identifier, a background color,
// and a collection of elements. It provides functionality to add new image elements to the card.

import SwiftUI

struct Card: Identifiable {
  let id = UUID() // Unique identifier for each card
  var backgroundColor: Color = .yellow // Default background color of the card
  var elements: [CardElement] = [] // Array to hold the elements of the card

  // Function to add a new image element to the card
  mutating func addElement(uiImage: UIImage) {
    let element = ImageElement(uiImage: uiImage) // Create a new image element
    elements.append(element) // Add the element to the card's elements
  }
}
