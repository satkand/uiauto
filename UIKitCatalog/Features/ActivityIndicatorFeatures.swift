//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class ActivityIndicatorFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()
  }

  func testActivityIndicatorAnimation() {
    application.tap(element: .init(type: .cell, identifier: "cell_activity_indicator"))
    application.verifyExistence(ofElement: .init(type: .activityIndicator, identifier: "activity_indicator_gray"))
  }
}
