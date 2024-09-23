// Transform

// Created by Raymond Shelton on 9/15/24.

// This struct defines the transformation properties for card elements, including size, rotation,
// and offset. It provides a way to manage the visual positioning and scaling of elements.

import SwiftUI

struct Transform {
  var size = CGSize(
    width: Settings.defaultElementSize.width, // Default width from settings
    height: Settings.defaultElementSize.height) // Default height from settings
  var rotation: Angle = .zero // Initial rotation set to zero
  var offset: CGSize = .zero // Initial offset set to zero
}
