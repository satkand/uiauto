//  Copyright © 2018 Apple. All rights reserved.

import XCTest
import Robocop

final class ActivityIndicatorFeatures: XCTestCase {
        
  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()
  }

  func testActivityIndicatorAnimation() {
    application.tap(.cell, withIdentifier: "cell_activity_indicator")
    application.verifyExistence(ofElement: .activityIndicator, withIdentifier: "activity_indicator_gray")
  }
}
