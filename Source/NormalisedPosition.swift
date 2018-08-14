//  Copyright © 2018 Outware Mobile. All rights reserved.

import Foundation

/// Represents a relative position in the containing plane. If we consider a frame, (0.0, 0.0) would represent the
/// top-left point while (1.0, 1.0) the bottom-right point.
struct NormalisedPosition {

  private let x: CGFloat
  private let y: CGFloat

  /// Initialises a normalised position with the given x and y values. Crashes if given values that are not between
  /// 0.0 and 1.0.
  ///
  /// - Parameters:
  ///   - x: the value representing the horizontal position.
  ///   - y: the value representing the vertical position.
  init(x: CGFloat, y: CGFloat) {
    guard x >= 0 && x <= 1 else {
      fatalError("Invalid horizontal position: Normalised values should be between 0.0 and 1.0.")
    }

    guard y >= 0 && y <= 1 else {
      fatalError("Invalid vertical position: Normalised values should be between 0.0 and 1.0.")
    }

    self.x = x
    self.y = y
  }

  var vector: CGVector {
    return CGVector(dx: x, dy: y)
  }
}
