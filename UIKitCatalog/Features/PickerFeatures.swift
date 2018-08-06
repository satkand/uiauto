//  Copyright © 2018 Apple. All rights reserved.

import XCTest
import Robocop

final class PickerFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.tap(.cell, atIndex: 6)
  }

  func testPicker() {

    application.pick("55", fromColumn: 0, inPicker: "picker_picker_wheel")
    application.pick("65", fromColumn: 1, inPicker: "picker_picker_wheel")
    application.pick("75", fromColumn: 2)
  }
}
