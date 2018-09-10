//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class ActivityIndicatorFeature: Feature {
  override func afterLaunch() {
    let cell = Cell(identifier: "cell_activity_indicator")
    app.tap(element: cell)
  }

  func testActivityIndicatorToBeVisible() {
    let activityIndicator = ActivityIndicator(identifier: "activity_indicator_gray")

    app.expect(element: activityIndicator, to: .exist(true))
    app.expect(element: activityIndicator, to: .beVisible(true))
  }

  func testActivityIndicatorToBeInvisible() {
    let activityIndicator = ActivityIndicator(identifier: "activity_sdsdindicator_gray")

    app.expect(element: activityIndicator, to: .exist(false))
    app.expect(element: activityIndicator, to: .beVisible(false))
  }
}
