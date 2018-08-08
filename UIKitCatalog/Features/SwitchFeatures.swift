//  Copyright © 2018 Apple. All rights reserved.

import XCTest
import Robocop

final class SwitchFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.tap(element: .init(type: .cell, index: 13))
  }

  func testSwitches() {
    application.expect(element: .init(type: .switch, identifier: "default_switch"), to: .haveBool(true))
    application.expect(element: .init(type: .switch, index: 1), to: .haveBool(true))

    application.tap(element: .init(type: .switch, identifier: "default_switch"))
    application.tap(element: .init(type: .switch, index: 1))

    application.expect(element: .init(type: .switch, identifier: "default_switch"), to: .haveBool(false))
    application.expect(element: .init(type: .switch, index: 1), to: .haveBool(false))

    application.tap(element: .init(type: .switch, index: 1))

    application.expect(element: .init(type: .switch, index: 1), to: .haveBool(true))
  }
}
