// CardDetailView

// Created by Raymond Shelton on 9/15/24.

// This view presents the details of a card, displaying its background color and elements.
// Each element can be manipulated with a resizable view modifier for interactive customization.

import SwiftUI

struct CardDetailView: View {
  @EnvironmentObject var store: CardStore // Access to the shared CardStore
  @Binding var card: Card // Binding to the card being detailed

  var body: some View {
    ZStack {
      // Set the background color of the card
      card.backgroundColor
      
      // Loop through the card's elements and create a view for each
      ForEach($card.elements, id: \.id) { $element in
        CardElementView(element: element) // Display the card element
          .resizableView(transform: $element.transform) // Apply resizable functionality
          .frame(
            width: element.transform.size.width, // Set the width from the element's transform
            height: element.transform.size.height // Set the height from the element's transform
          )
      }
    }
  }
}

// Preview provider to display the CardDetailView in the SwiftUI canvas
struct CardDetailView_Previews: PreviewProvider {
  struct CardDetailPreview: View {
    @EnvironmentObject var store: CardStore // Access to the shared CardStore
    var body: some View {
      // Show a preview of the first card in the store
      CardDetailView(card: $store.cards[0])
    }
  }

  static var previews: some View {
    CardDetailPreview()
      .environmentObject(CardStore(defaultData: true)) // Provide a sample CardStore for the preview
  }
}
