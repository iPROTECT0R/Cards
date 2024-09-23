// StickerModal

// Created by Raymond Shelton on 9/15/24.

// This modal presents a grid of sticker images for the user to choose from.
// When a sticker is selected, it updates the provided binding with the selected image.

import SwiftUI

struct StickerModal: View {
  @Environment(\.dismiss) var dismiss // Environment variable to dismiss the modal
  @Binding var stickerImage: UIImage? // Binding to hold the selected sticker image
  @State private var stickerNames: [String] = [] // State to store the names of available stickers
  let columns = [
    GridItem(.adaptive(minimum: 120), spacing: 10) // Define the grid layout for stickers
  ]

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns) {
        // Loop through each sticker name and display the corresponding image
        ForEach(stickerNames, id: \.self) { sticker in
          Image(uiImage: image(from: sticker)) // Load the image from the sticker path
            .resizable()
            .aspectRatio(contentMode: .fit)
            .onTapGesture {
              // Set the selected sticker image and dismiss the modal when tapped
              stickerImage = image(from: sticker)
              dismiss()
            }
        }
      }
    }
    .onAppear {
      stickerNames = Self.loadStickers() // Load sticker names when the modal appears
    }
  }

  // Function to load sticker names from the app bundle
  static func loadStickers() -> [String] {
    var themes: [URL] = [] // Array to hold theme directories
    var stickerNames: [String] = [] // Array to hold sticker file paths
    let fileManager = FileManager.default
    
    // Get the resource path and enumerate through the "Stickers" directory
    if let resourcePath = Bundle.main.resourcePath,
       let enumerator = fileManager.enumerator(
         at: URL(fileURLWithPath: resourcePath + "/Stickers"),
         includingPropertiesForKeys: nil,
         options: [
           .skipsSubdirectoryDescendants,
           .skipsHiddenFiles
         ]) {
      for case let url as URL in enumerator where url.hasDirectoryPath {
        themes.append(url) // Add theme directory URLs
      }
    }
    
    // Get all sticker files from the identified themes
    for theme in themes {
      if let files = try? fileManager.contentsOfDirectory(atPath: theme.path) {
        for file in files {
          stickerNames.append(theme.path + "/" + file) // Add each sticker path to the array
        }
      }
    }
    return stickerNames // Return the list of sticker paths
  }

  // Function to create a UIImage from a given path
  func image(from path: String) -> UIImage {
    print("loading:", path) // Log the loading process
    return UIImage(named: path) // Try to load the image by name
      ?? UIImage(named: "error-image") // Fallback to a default error image
      ?? UIImage() // Return an empty image if all else fails
  }
}

// Preview provider to display the StickerModal in the SwiftUI canvas
struct StickerModal_Previews: PreviewProvider {
  static var previews: some View {
    StickerModal(stickerImage: .constant(UIImage())) // Preview with an empty UIImage
  }
}
