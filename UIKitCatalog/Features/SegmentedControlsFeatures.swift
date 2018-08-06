//  Copyright © 2018 Apple. All rights reserved.

import XCTest
import Robocop

final class SegmentedControlsFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.tap(.cell, atIndex: 9)
  }

  func testSegmentedControls() {
    application.tap(.button, withIdentifier: "Tools")
    application.tap(.button, atIndex: 6)
  }
}
