// CardsListView

// Created by Raymond Shelton on 9/15/24.

// This view displays a list of card thumbnails. Tapping on a thumbnail brings up a detailed view
// of the selected card. It uses an environment object to access the CardStore.

import SwiftUI

struct CardsListView: View {
  @EnvironmentObject var store: CardStore // Access the shared CardStore
  @State private var selectedCard: Card? // Track the currently selected card

  var body: some View {
    list
      // Present a full-screen cover when a card is selected
      .fullScreenCover(item: $selectedCard) { card in
        if let index = store.index(for: card) {
          // Show the detailed view of the selected card
          SingleCardView(card: $store.cards[index])
        } else {
          fatalError("Unable to locate selected card") // Handle missing card gracefully
        }
      }
  }

  var list: some View {
    ScrollView(showsIndicators: false) {
      VStack {
        // Loop through the cards and create a thumbnail for each
        ForEach(store.cards) { card in
          CardThumbnail(card: card)
            // Set up a gesture to select the card when tapped
            .onTapGesture {
              selectedCard = card
            }
        }
      }
    }
  }
}

// Preview provider to display the CardsListView in the SwiftUI canvas
struct CardsListView_Previews: PreviewProvider {
  static var previews: some View {
    CardsListView()
      .environmentObject(CardStore(defaultData: true)) // Provide a sample CardStore for preview
  }
}
