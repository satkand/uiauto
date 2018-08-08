//  Copyright © 2018 Outware Mobile. All rights reserved.

import XCTest

extension XCUIElement {
  
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
