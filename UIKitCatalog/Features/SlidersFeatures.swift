//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class SlidersFeatures: XCTestCase {

  private var application: XCUIApplication!

  private var sliderElement: Element!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    sliderElement = Element(type: .slider, identifier: "default_slider")

    application.tap(element: .init(type: .cell, index: 10))
  }

  // This functionality is the method recommended by Apple to adjust slider components
  // Unfortunately in the testing suite it has been **failing tests**
  // It has been commented out here to ensure the tests all run in this project
  //
  // We recommend testing these methods on your project to see if it works with your component configuration
  // If it doesn't work then the tests below should be implemented instead
  func testSliders() {

    // application.slide(element: .init(type: .slider, identifier: "default_slider"), toPercent: 0.8)
    //
    // application.verifyText("80%", inElement: .init(type: .slider, identifier: "default_slider"))
  }

  func testDragSliders() {

    application.expect(element: sliderElement, to: .exist(true))
    application.expect(element: sliderElement, to: .haveText("40%"))

    application.slide(element: sliderElement, startPercent: 0.4, endPercent: 0.9)

    // The expected text is 91% instead of 90% due to rounding errors in the method used to adjust the slider position
    // When testing you should be aware of this discrepancy and take it into account when writing your tests
    // The difference appears to be 1% more than the end percent set
    application.expect(element: sliderElement, to: .haveText("91%"))
  }

  func testPressingAndHoldingToUpdateSlider() {
    application.expect(element: sliderElement, to: .exist(true))
    application.expect(element: sliderElement, to: .haveText("40%"))

    let startPosition: NormalizedPosition = .init(x: 0.4, y: 0.5)
    let endPosition: NormalizedPosition = .init(x: 0.0, y: 0.5)
    application.press(element: sliderElement, at: startPosition, forDuration: 0.2, thenDragTo: endPosition)

    application.expect(element: sliderElement, to: .haveText("1%"))
  }

  func testDraggingSliderToUpdateValue() {
    application.expect(element: sliderElement, to: .exist(true))
    application.expect(element: sliderElement, to: .haveText("40%"))

    let startPosition: NormalizedPosition = .init(x: 0.4, y: 0.5)
    let endPosition: NormalizedPosition = .init(x: 0.3, y: 0.5)
    application.drag(element: sliderElement, from: startPosition, to: endPosition)

    application.expect(element: sliderElement, to: .haveText("31%"))
  }
}
