// CardStore

// Created by Raymond Shelton on 9/15/24.

// This class serves as a view model for managing a collection of cards.
// It allows for the observation of card changes and provides functionality
// for accessing and initializing card data.

import SwiftUI

class CardStore: ObservableObject {
  @Published var cards: [Card] = [] // Array to hold the cards, published to notify views of changes

  init(defaultData: Bool = false) {
    // Initialize the store with default data if specified
    if defaultData {
      cards = initialCards // Load initial card data
    }
  }

  // Function to find the index of a specific card
  func index(for card: Card) -> Int? {
    cards.firstIndex { $0.id == card.id } // Return the index of the card with the matching ID
  }
}
