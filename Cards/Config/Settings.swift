// Settings

// Created by Raymond Shelton on 9/15/24.

// This enum contains static settings used throughout the app, including sizes for cards and thumbnails,
// default element size, and styling options like border color and width.

import SwiftUI

enum Settings {
  static let cardSize =
    CGSize(width: 1300, height: 2000) // Default size for cards
  static let thumbnailSize =
    CGSize(width: 150, height: 250) // Default size for thumbnails
  static let defaultElementSize =
    CGSize(width: 250, height: 180) // Default size for card elements
  static let borderColor: Color = .blue // Default border color
  static let borderWidth: CGFloat = 5 // Default border width
}
