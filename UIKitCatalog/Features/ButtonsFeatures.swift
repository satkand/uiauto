//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class ButtonsFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.tap(element: .init(type: .cell, index: 2))
  }

  func testButtons() {
    application.tap(element: .init(type: .button, identifier: "Button"))
    application.tap(element: .init(type: .button, index: 1))
    application.tap(element: .init(type: .button, identifier: "buttons_image_button"))
  }
}
