// CardsApp

// Created by Raymond Shelton on 9/15/24.

// This is the main entry point of the app. Here, we set up the CardStore and pass it as an environment object
// to the CardsListView, so all the child views can easily access the card data.

import SwiftUI

@main
struct CardsApp: App {
  // We're creating a state object to manage our card data, starting with some default data
  @StateObject var store = CardStore(defaultData: true)

  var body: some Scene {
    WindowGroup {
      // This is where we set CardsListView as the main view, injecting the store for easy access
      CardsListView()
        .environmentObject(store)
    }
  }
}
