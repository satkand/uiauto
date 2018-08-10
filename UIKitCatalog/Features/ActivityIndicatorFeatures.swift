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

    // Test activity indicator exists and is visible
    application.expect(element: .init(type: .activityIndicator, identifier: "activity_indicator_gray"), to: .exist(true))
    application.expect(element: .init(type: .activityIndicator, identifier: "activity_indicator_gray"), to: .beVisible(true))

    // Test activity indicator does not exists and is not visible
    application.expect(element: .init(type: .activityIndicator, identifier: "activity_sdsdindicator_gray"), to: .exist(false))
    application.expect(element: .init(type: .activityIndicator, identifier: "activity_sdsdindicator_gray"), to: .beVisible(false))
  }
}
