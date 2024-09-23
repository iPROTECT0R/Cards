// SingleCardView

// Created by Raymond Shelton on 9/15/24.

// This view displays the details of a single card. It utilizes a NavigationStack
// to enable navigation and includes a toolbar for additional options related to the card.

import SwiftUI

struct SingleCardView: View {
  @Binding var card: Card // Binding to the card being displayed
  @State private var currentModal: ToolbarSelection? // Track the currently selected modal in the toolbar

  var body: some View {
    NavigationStack {
      // Show the card details along with the toolbar for actions
      CardDetailView(card: $card)
        .modifier(CardToolbar(
          currentModal: $currentModal,
          card: $card)) // Apply the toolbar modifier
    }
  }
}

// Preview provider to display the SingleCardView in the SwiftUI canvas
struct SingleCardView_Previews: PreviewProvider {
  struct SingleCardPreview: View {
    @EnvironmentObject var store: CardStore // Access the shared CardStore
    var body: some View {
      // Preview the first card in the store
      SingleCardView(card: $store.cards[0])
    }
  }
  
  static var previews: some View {
    SingleCardPreview()
      .environmentObject(CardStore(defaultData: true)) // Provide a sample CardStore for the preview
  }
}
