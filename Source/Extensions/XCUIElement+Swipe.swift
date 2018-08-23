//  Copyright © 2018 Outware Mobile. All rights reserved.

import XCTest

extension XCUIElement {
  /// Swiping directions.
  ///
  /// **Notes**: the swiping direction will *scroll* in the opposite direction
  public enum Direction {
    /// Scrolls down
    case up

    /// Scrolls left
    case right

    /// Scrolls up
    case down

    /// Scrolls right
    case left

    var vector: CGVector {
      switch self {
      case .up: return CGVector(dx: 0, dy: -1)
      case .down: return CGVector(dx: 0, dy: 1)
      case .left: return CGVector(dx: -1, dy: 0)
      case .right: return CGVector(dx: 1, dy: 0)
      }
    }
  }

  /// Convenience function to swipe towards a specific direction.
  ///
  /// - parameters:
  ///     - direction: the direction of the swipe
  func swipe(withDirection direction: Direction) {
    switch direction {
    case .up: swipeUp()
    case .right: swipeRight()
    case .down: swipeDown()
    case .left: swipeLeft()
    }
  }
}
