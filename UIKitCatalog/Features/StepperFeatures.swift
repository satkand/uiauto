//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class StepperFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.tap(element: .init(type: .cell, index: 12))
  }

  func testSteppers() {

    // We can either use the automatic increment and decrement identifiers or the index of the stepper buttons
    // We cannot set the identifiers and cannot use both identifier and index in conjunction with each other
    // This means if we have multiple steppers we should use index
    application.expect(element: .init(type: .button, identifier: "Increment"), to: .exist(true))
    application.expect(element: .init(type: .button, index: 1), to: .exist(true))

    XCTAssertEqual(application.staticTexts.firstMatch.label, "0")

    // We can tap a button using the specific index of that button
    application.tap(element: .init(type: .button, index: 1))

    // Or we can find the specific cell and identify the button with its pre-set identifier
    let thirdIncrementButton: XCUIElement = application.tables.firstMatch.cells.element(boundBy: 2).buttons["Increment"]
    thirdIncrementButton.tap()
    thirdIncrementButton.tap()

    XCTAssertEqual(application.staticTexts.firstMatch.label, "1")
    XCTAssertEqual(application.staticTexts.allElementsBoundByIndex[2].label, "2")

    // We cannot go below 0 even if we click the decremenent button multiple times
    application.tap(element: .init(type: .button, identifier: "Decrement"))
    application.tap(element: .init(type: .button, identifier: "Decrement"))

    XCTAssertEqual(application.staticTexts.firstMatch.label, "0")
  }
}
