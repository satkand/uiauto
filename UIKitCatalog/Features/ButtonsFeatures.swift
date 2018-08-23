//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class ButtonsFeatures: Feature {
  override func afterLaunch() {
    let cell = Cell(index: 2)
    app.tap(element: cell)
  }

  func testButtons() {
    let buttonWithIdentifier = Button(identifier: "Button")
    app.tap(element: buttonWithIdentifier, timeout: 2)

    let buttonAtIndex = Button(index: 1)
    app.tap(element: buttonAtIndex)

    let ButtonWithImage = Button(identifier: "buttons_image_button")
    app.tap(element: ButtonWithImage)
  }
}
