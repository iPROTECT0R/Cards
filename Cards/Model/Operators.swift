// Operators

// Created by Raymond Shelton on 9/15/24.

// This code provides custom operators to perform mathematical operations on CGSize,
// enabling easy manipulation of size dimensions for card elements.

import SwiftUI

// Addition operator for CGSize
func + (left: CGSize, right: CGSize) -> CGSize {
  CGSize(
    width: left.width + right.width, // Sum the widths
    height: left.height + right.height) // Sum the heights
}

// Multiplication operator for CGSize by a CGFloat
func * (left: CGSize, right: CGFloat) -> CGSize {
  CGSize(
    width: left.width * right, // Multiply width by the scalar
    height: left.height * right) // Multiply height by the scalar
}

// In-place multiplication operator for CGSize by a Double
func *= (left: inout CGSize, right: Double) {
  left = CGSize(
    width: left.width * right, // Multiply width by the scalar
    height: left.height * right) // Multiply height by the scalar
}

// Division operator for CGSize by a CGFloat
func / (left: CGSize, right: CGFloat) -> CGSize {
  CGSize(
    width: left.width / right, // Divide width by the scalar
    height: left.height / right) // Divide height by the scalar
}
