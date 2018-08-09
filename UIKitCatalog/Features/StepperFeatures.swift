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

    // We cannot access the stepper component by setting an accessabilityIdentifier and retrieving it
    // This means we have to use the buttons inside the stepper
    // The '-' button has the automatic accessablityIdentifier of "Decrement"
    // The '+' button has the automatic accessablityIdentifier of "Increment"
    // These identifiers do not take into account the index of the component so they should only be used when there is only one stepper
    // in the view
    // Otherwise we need to use the index of the buttons inside the stepper
    // We should be very aware of other buttons in the view and other steppers when calculating the index we are looking to retrieve
    application.expect(element: .init(type: .button, identifier: "Increment"), to: .exist(true))
    application.expect(element: .init(type: .button, index: 1), to: .exist(true))

    application.expect(element: .init(type: .label, index: 0), to: .haveText("0"))

    // When we tap a stepper we must first retreive the correct button before tapping it
    application.tap(element: .init(type: .button, index: 1))

    // We can also find the specific cell and identify the button with its pre-set identifier
    // This only works if there is only a single stepper in the specific view e.g. cell
    let thirdIncrementButton: XCUIElement = application.tables.firstMatch.cells.element(boundBy: 2).buttons["Increment"]

    thirdIncrementButton.tap()
    thirdIncrementButton.tap()

    // We can set the accessabilityIdentifier of the label the stepper updates so we can access this with identifier or index
    application.expect(element: .init(type: .label, identifier: "default_stepper_label"), to: .haveText("1"))
    application.expect(element: .init(type: .label, index: 2), to: .haveText("2"))

    // We cannot go below 0 even if we click the decremenent button multiple times
    application.tap(element: .init(type: .button, identifier: "Decrement"))
    application.tap(element: .init(type: .button, identifier: "Decrement"))

    application.expect(element: .init(type: .label, index: 0), to: .haveText("0"))
  }
}
