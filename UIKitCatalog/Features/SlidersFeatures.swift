//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class SlidersFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

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

    application.expect(element: .init(type: .slider, identifier: "default_slider"), to: .exist(true))
    application.expect(element: .init(type: .slider, identifier: "default_slider"), to: .haveText("40%"))

    application.slide(element: .init(type: .slider, identifier: "default_slider"), startPercent: 0.4, endPercent: 0.9)

    application.expect(element: .init(type: .slider, identifier: "default_slider"), to: .haveText("91%"))
  }
}
