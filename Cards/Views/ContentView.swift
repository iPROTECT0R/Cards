// ContentView

// Created by Raymond Shelton on 9/15/24.

// This view displays a simple interface with a globe icon and a greeting message.
// It uses a vertical stack to arrange the image and text nicely.

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      // Display a globe icon with a large scale and accent color
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      
      // Show a greeting message
      Text("Hello, world!")
    }
    // Add some padding around the content
    .padding()
  }
}

// Preview provider for displaying the ContentView in the SwiftUI canvas
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
