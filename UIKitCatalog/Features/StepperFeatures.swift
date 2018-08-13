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

  /// We **CANNOT** access the stepper component by setting an `accessibilityIdentifier` and retrieving it.
  /// This means we have to use the buttons directly as opposed to using the stepper.
  ///
  /// We should be aware of other buttons in the view and other steppers when calculating the index we are looking to retrieve.
  ///
  /// Please note: the index of the steppers are **backwards**, i.e.: the increment index comes before the decrement one.
  ///
  /// In this case:
  /// - Button at index 0 => Back Navigation
  /// - Button at index 1 => increment first stepper
  /// - Button at index 2 => decrement first stepper
  func testSteppers() {

    application.expect(element: .init(type: .button, index: 1), to: .exist(true))
    application.expect(element: .init(type: .button, index: 2), to: .exist(true))

    application.expect(element: .init(type: .label, index: 0), to: .haveText("0"))

    application.tap(element: .init(type: .button, index: 1))

    application.expect(element: .init(type: .label, index: 0), to: .haveText("1"))

    // We cannot go below 0 even if we click the decremenent button multiple times
    application.tap(element: .init(type: .button, index: 2))
    application.tap(element: .init(type: .button, index: 2))

    application.expect(element: .init(type: .label, index: 0), to: .haveText("0"))
  }
}
