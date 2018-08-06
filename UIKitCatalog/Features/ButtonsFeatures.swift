//  Copyright © 2018 Apple. All rights reserved.

import XCTest
import Robocop

final class ButtonsFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.tap(.cell, atIndex: 2)
  }

  func testButtons() {
    application.tap(.button, withIdentifier: "Button")
    application.tap(.button, atIndex: 1)
    application.tap(.button, withIdentifier: "buttons_image_button")
  }
}
