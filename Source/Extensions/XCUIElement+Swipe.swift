//  Copyright © 2018 Outware Mobile. All rights reserved.

import XCTest

extension XCUIElement {
  
  public func swipe(withDirection direction: XCUIApplication.Direction) {
    
    switch direction {
    case .up: self.swipeUp()
    case .right: self.swipeRight()
    case .down: self.swipeDown()
    case .left: self.swipeLeft()
    }
  }
}
