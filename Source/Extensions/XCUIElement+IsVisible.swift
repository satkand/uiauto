//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIElement {

  public var isVisible: Bool {
    guard exists && !frame.isEmpty else { return false }

    return XCUIApplication().windows.element(boundBy: 0).frame.contains(frame)
  }
}
