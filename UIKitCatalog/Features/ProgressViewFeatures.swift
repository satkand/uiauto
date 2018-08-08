//  Copyright © 2018 Apple. All rights reserved.

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
    application.verifyText("0%", inElement: .init(type: .progressView, identifier: "default_progress_view"))
    sleep(1)
    application.verifyText("10%", inElement: .init(type: .progressView, identifier: "default_progress_view"))
  }
}
