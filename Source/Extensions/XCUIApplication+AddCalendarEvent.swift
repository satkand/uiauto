//  Copyright © 2018 Outware Mobile. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Add an event to a calendar
  ///
  /// If the *calendar permission* alert dialog is displayed, the request will be **automatically** accepted.
  ///
  /// - Parameters:
  ///   - timeout: the specified amount of time to wait for elements to exist
  ///   - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called
  ///   - line: the line number on which failure occurred. Defaults to the line number on which this function was called
  public func addCalendarEvent(timeout: TimeInterval = 2, file: StaticString = #file, line: UInt = #line) {
    acceptPermissionIfRequired(for: .calendar, timeout: timeout, file: file, line: line)
    tap(element: .init(type: .navigationBarButton, identifier: "Add"), timeout: timeout, file: file, line: line)
  }

  /// Closes the event editing screen without adding the event.
  ///
  /// If the *calendar permission* alert dialog is displayed, the request will be **automatically** accepted.
  ///
  /// - Parameters:
  ///   - timeout: the specified amount of time to wait for elements to exist
  ///   - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called
  ///   - line: the line number on which failure occurred. Defaults to the line number on which this function was called
  public func cancelAddingEvent(timeout: TimeInterval = 2, file: StaticString = #file, line: UInt = #line) {
    acceptPermissionIfRequired(for: .calendar, timeout: timeout, file: file, line: line)
    tap(element: .init(type: .button, identifier: "Cancel"), timeout: timeout, file: file, line: line)
  }
}
