// Text Extension

// Created by Raymond Shelton on 9/15/24.

// This extension adds a method to the Text type, allowing for scalable text that adjusts
// its size based on the available space, ensuring it stays within one line.

import SwiftUI

extension Text {
  // Function to create scalable text with a specified font size
  func scalableText(font: Font = Font.system(size: 1000)) -> some View {
    self
      .font(font) // Set the font for the text
      .minimumScaleFactor(0.01) // Allow the text to scale down to 1% of the original size
      .lineLimit(1) // Limit the text to a single line
  }
}
