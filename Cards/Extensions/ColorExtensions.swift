// Color Extension

// Created by Raymond Shelton on 9/15/24.

// This extension adds functionality to the Color type, including a static array of colors
// and a method to retrieve a random color from the array.

import SwiftUI

extension Color {
  static let colors: [Color] = [
    .green, .red, .blue, .gray, .yellow, .pink, .orange, .purple // Array of predefined colors
  ]

  // Function to return a random color from the colors array
  static func random() -> Color {
    colors.randomElement() ?? .black // Return a random color or black if the array is empty
  }
}
