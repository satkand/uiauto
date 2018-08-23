//  Copyright © 2018 Outware Mobile. All rights reserved.

import XCTest

extension XCTestCase {
  /// Uninstall application from device or simulator similarly to how a user would.
  ///
  /// This function relies on the SpringBoard application to perform the uninstallation.
  ///
  /// - Parameters:
  ///     - applicationName: the name of the application to uninstall
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func uninstallApplication(named applicationName: String, timeout: TimeInterval = 1, file: StaticString = #file, line: UInt = #line) {
    // The SpringBoard is the application that manages the home screen on iOS devices
    let springBoardApplication: XCUIApplication = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    springBoardApplication.activate()

    let applicationIconElement: Element = .init(type: .icon, identifier: applicationName)

    // Get the icon of the application you need to uninstall
    springBoardApplication.press(element: applicationIconElement, forDuration: 1.3, timeout: timeout, file: file, line: line)

    let applicationIcon: XCUIElement = springBoardApplication.first(element: applicationIconElement, timeout: timeout, file: file, line: line)

    // The "x" button is not exposed, so in order to tap on it
    // we'll need to calculate its location based on the location of the application icon in the springboard.
    springBoardApplication.coordinate(
      withNormalizedOffset: CGVector(
        dx: (applicationIcon.frame.minX + 3) / springBoardApplication.frame.maxX,
        dy: (applicationIcon.frame.minY + 3) / springBoardApplication.frame.maxY
      )
    ).tap()

    // It takes a bit of time for the alert to be displayed, hence we'll have to sleep the process for a short amount of time.
    sleep(1)

    // Hit the delete button in the alert
    springBoardApplication.tap(element: .init(type: .alertButton, identifier: "Delete"), timeout: timeout, file: file, line: line)

    // Exit edit mode
    XCUIDevice.shared.press(.home)

    // Animations are still ocurring after deletion, so this delay is needed in order to ensure the app is deleted
    sleep(2)
  }
}
