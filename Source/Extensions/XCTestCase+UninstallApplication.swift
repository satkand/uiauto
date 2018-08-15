//  Copyright © 2018 Outware Mobile. All rights reserved.

import XCTest

extension XCTestCase {

  /// Uninstall application from device or simulator similarly to how a user would.
  ///
  /// This function relies on the SpringBoard application to perform the uninstallation.
  ///
  /// - Parameters:
  ///     - applicationName: the name of the application to uninstall
  public func uninstallApplication(named applicationName: String) {

    // The SpringBoard is the application that manages the home screen on iOS devices
    let springBoardApplication: XCUIApplication = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    springBoardApplication.activate()

    // Get the icon of the application you need to uninstall
    let applicationIcon: XCUIElement = springBoardApplication.icons[applicationName].firstMatch

    guard applicationIcon.exists else { return }

    // Press and hold for 1.3 seconds
    applicationIcon.press(forDuration: 1.3)

    // The "x" button is not exposed, so in order to tap on it
    // we'll need to calculate it's location based on the position of the application icon in the springboard.
    springBoardApplication.coordinate(
      withNormalizedOffset: CGVector(
        dx: (applicationIcon.frame.minX + 3) / springBoardApplication.frame.maxX,
        dy: (applicationIcon.frame.minY + 3) / springBoardApplication.frame.maxY
      )
    ).tap()

    // It takes a bit of time for the alert to be displayed, hence we'll have to sleep the process for a short amount of time.
    sleep(1)

    // Hit the delete button in the alert
    springBoardApplication.alerts.buttons["Delete"].tap()

    // Exit edit mode
    XCUIDevice.shared.press(.home)
  }
}
