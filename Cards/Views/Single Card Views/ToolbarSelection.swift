// ToolbarSelection

// Created by Raymond Shelton on 9/15/24.

// This enum defines the various modal selections available in the toolbar.
// Each case represents a different type of content that can be added or modified.

import Foundation

enum ToolbarSelection: CaseIterable, Identifiable {
  var id: Int {
    hashValue // Unique identifier for each selection
  }

  case photoModal, frameModal, stickerModal, textModal // Different modal options
}
