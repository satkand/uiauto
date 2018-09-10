//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class SegmentedControlsFeatures: Feature {
  override func afterLaunch() {
    app.tap(element: Cell(index: 9))
  }

  func testSegmentedControls() {
    app.tap(element: Button(identifier: "Tools"))
    app.tap(element: Button(index: 6))
  }
}
