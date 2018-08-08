//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class SwitchFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.tap(element: .init(type: .cell, index: 13))
  }

  func testSwitches() {
    application.tap(element: .init(type: .switch, identifier: "switch_switch"))
    application.tap(element: .init(type: .switch, index: 1))
    application.tap(element: .init(type: .switch, index: 1))

    application.verifyText("0", inElement: .init(type: .switch, identifier: "switch_switch"))
  }
}
