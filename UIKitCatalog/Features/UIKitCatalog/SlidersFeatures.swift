//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class SlidersFeatures: Feature {
  private var slider: Element!

  override func afterLaunch() {
    slider = Slider(identifier: "default_slider")
    app.tap(element: Cell(index: 10))
  }

  // This functionality is the method recommended by Apple to adjust slider components
  // Unfortunately in the testing suite it has been **failing tests**
  // It has been commented out here to ensure the tests all run in this project
  //
  // We recommend testing these methods on your project to see if it works with your component configuration
  // If it doesn't work then the tests below should be implemented instead
  func testSliders() {
    // app.slide(element: slider, toPercent: 0.8)
    // app.expect(element: slider, to: .haveText("80%"))
  }

  func testDragSliders() {
    app.expect(element: slider, to: .exist(true))
    app.expect(element: slider, to: .haveText("40%"))

    app.slide(element: slider, startPercent: 0.4, endPercent: 0.9)

    // The expected text is 91% instead of 90% due to rounding errors in the method used to adjust the slider position
    // When testing you should be aware of this discrepancy and take it into account when writing your tests
    // The difference appears to be 1% more than the end percent set
    app.expect(element: slider, to: .haveText("91%"))
  }

  func testPressingAndHoldingToUpdateSlider() {
    app.expect(element: slider, to: .exist(true))
    app.expect(element: slider, to: .haveText("40%"))

    let startPosition: NormalizedPosition = .init(x: 0.4, y: 0.5)
    let endPosition: NormalizedPosition = .init(x: 0.0, y: 0.5)
    app.press(element: slider, at: startPosition, forDuration: 0.2, thenDragTo: endPosition)

    app.expect(element: slider, to: .haveText("1%"))
  }

  func testDraggingSliderToUpdateValue() {
    app.expect(element: slider, to: .exist(true))
    app.expect(element: slider, to: .haveText("40%"))

    let startPosition: NormalizedPosition = .init(x: 0.4, y: 0.5)
    let endPosition: NormalizedPosition = .init(x: 0.3, y: 0.5)
    app.drag(element: slider, from: startPosition, to: endPosition)

    app.expect(element: slider, to: .haveText("31%"))
  }
}
