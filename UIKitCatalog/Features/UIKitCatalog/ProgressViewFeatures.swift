//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class ProgressViewFeatures: Feature {
  override func afterLaunch() {
    app.tap(element: Cell(index: 7))
  }

  func testProgressViews() {
    let progressView = ProgressView(identifier: "default_progress_view")
    app.expect(element: progressView, to: .haveText("0%"))

    app.tap(element: Button(identifier: "start_progress_button"))
    sleep(2)
    app.expect(element: progressView, to: .haveText("100%"))
  }
}
