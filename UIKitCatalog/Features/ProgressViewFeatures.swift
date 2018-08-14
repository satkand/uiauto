//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class ProgressViewFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.tap(element: .init(type: .cell, index: 7))
  }

  func testProgressViews() {
    application.expect(element: .init(type: .progressView, identifier: "default_progress_view"), to: .haveText("0%"))

    application.tap(element: .init(type: .button, identifier: "start_progress_button"))
    sleep(2)
    application.expect(element: .init(type: .progressView, identifier: "default_progress_view"), to: .haveText("100%"))
  }
}
