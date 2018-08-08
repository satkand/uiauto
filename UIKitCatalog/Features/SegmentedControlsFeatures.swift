//  Copyright © 2018 Apple. All rights reserved.

import XCTest
import Robocop

final class SegmentedControlsFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.tap(element: .init(type: .cell, index: 9))
  }

  func testSegmentedControls() {
    application.tap(element: .init(type: .button, identifier: "Tools"))
    application.tap(element: .init(type: .button, index: 6))
  }
}
