//  Copyright © 2018 Apple. All rights reserved.

import XCTest
import Robocop

final class SwitchFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.tap(.cell, atIndex: 13)
  }

  func testSwitches() {
    application.tap(.switch, withIdentifier: "switch_switch")
    application.tap(.switch, atIndex: 1)
    application.tap(.switch, atIndex: 1)

    application.verifyValue(expectedValue: "0", inElement: .switch, withIdentifier: "switch_switch")
  }
}
