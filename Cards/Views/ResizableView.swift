// ResizableView

// Created by Raymond Shelton on 9/15/24.

// This view modifier allows for dragging, rotating, and scaling of a view, making it interactive
// and customizable. It uses a binding to a Transform structure to manage the state of the view's transformations.

import SwiftUI

struct ResizableView: ViewModifier {
  @Binding var transform: Transform // Binding to the Transform state
  @State private var previousOffset: CGSize = .zero // Track the previous offset for drag gestures
  @State private var previousRotation: Angle = .zero // Track the previous rotation angle
  @State private var scale: CGFloat = 1.0 // Track the current scale factor

  var dragGesture: some Gesture {
    DragGesture()
      .onChanged { value in
        // Update the offset based on the drag translation
        transform.offset = value.translation + previousOffset
      }
      .onEnded { _ in
        // Save the new offset when the drag ends
        previousOffset = transform.offset
      }
  }

  var rotationGesture: some Gesture {
    RotationGesture()
      .onChanged { rotation in
        // Update the rotation based on the gesture
        transform.rotation += rotation - previousRotation
        previousRotation = rotation
      }
      .onEnded { _ in
        // Reset the previous rotation at the end of the gesture
        previousRotation = .zero
      }
  }

  var scaleGesture: some Gesture {
    MagnificationGesture()
      .onChanged { scale in
        // Update the scale during the magnification gesture
        self.scale = scale
      }
      .onEnded { scale in
        // Apply the scaling to the view's dimensions
        transform.size.width *= scale
        transform.size.height *= scale
        self.scale = 1.0 // Reset the scale for the next gesture
      }
  }

  func body(content: Content) -> some View {
    content
      .frame(
        width: transform.size.width,
        height: transform.size.height) // Set the frame size based on the transform
      .rotationEffect(transform.rotation) // Apply rotation
      .scaleEffect(scale) // Apply scaling
      .offset(transform.offset) // Apply offset
      .gesture(dragGesture) // Add drag gesture
      .gesture(SimultaneousGesture(rotationGesture, scaleGesture)) // Add rotation and scale gestures
      .onAppear {
        previousOffset = transform.offset // Initialize previous offset on appear
      }
  }
}

// Preview provider to show the ResizableView in the SwiftUI canvas
struct ResizableView_Previews: PreviewProvider {
  struct ResizableViewPreview: View {
    @State var transform = Transform() // State for the transform
    var body: some View {
      RoundedRectangle(cornerRadius: 30.0)
        .foregroundColor(Color.blue) // Example content to be resizable
        .resizableView(transform: $transform) // Apply the resizable modifier
    }
  }
  
  static var previews: some View {
    ResizableViewPreview() // Preview the resizable view
  }
}

// Extension to make it easier to apply the ResizableView modifier
extension View {
  func resizableView(transform: Binding<Transform>) -> some View {
    modifier(ResizableView(transform: transform)) // Use the modifier
  }
}
