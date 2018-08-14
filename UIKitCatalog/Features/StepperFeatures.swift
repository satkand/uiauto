//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class StepperFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.swipe(to: 12, in: "catalog_table", direction: .up)
    application.tap(element: .init(type: .cell, identifier: "cell_steppers"))
  }

  func testSteppers() {

    application.expect(stepButton: .up, atIndex: 0, toExists: true)
    application.expect(stepButton: .down, atIndex: 0, toExists: true)

    application.expect(element: .init(type: .label, index: 0), to: .haveText("0"))

    application.step(.up, index: 0)

    application.expect(element: .init(type: .label, index: 0), to: .haveText("1"))

    // We cannot go below 0 even if we click the decremenent button multiple times
    application.step(.down, index: 0)
    application.step(.down, index: 0)

    application.expect(element: .init(type: .label, index: 0), to: .haveText("0"))
  }
}
