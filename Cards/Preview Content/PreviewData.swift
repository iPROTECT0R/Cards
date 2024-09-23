// PreviewData

// Created by Raymond Shelton on 9/15/24.

// This code sets up initial data for the app, including a predefined array of cards
// with specific background colors and an empty array for card elements.

import SwiftUI

let initialCards: [Card] = [
  Card(backgroundColor: .green, elements: initialElements), // Green card with initial elements
  Card(backgroundColor: .orange), // Orange card with no elements
  Card(backgroundColor: .red), // Red card with no elements
  Card(backgroundColor: .purple), // Purple card with no elements
  Card(backgroundColor: .yellow) // Yellow card with no elements
]

let initialElements: [CardElement] = [] // Empty array for initial card elements
