//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIElement {

  /// Returns true depending on the following criteria:
  ///
  /// - the element exists on the screen
  /// - the element frame is not empty
  /// - the element is visible on the window
  public var isVisible: Bool {
    guard exists && !frame.isEmpty else { return false }

    return XCUIApplication().windows.element(boundBy: 0).frame.contains(frame)
  }
}
