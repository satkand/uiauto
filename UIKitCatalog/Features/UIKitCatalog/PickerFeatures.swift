//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class PickerFeatures: Feature {
  override func afterLaunch() {
    app.tap(element: Cell(index: 6))
  }

  func testPicker() {
    let picker = Picker(identifier: "picker_picker_wheel")
    app.pick("55", inWheelIndex: 0, inElement: picker)
    app.pick("65", inWheelIndex: 1, inElement: picker)
    app.pick("75", inWheelIndex: 2, inElement: picker)
  }
}
