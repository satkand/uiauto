//  Copyright © 2018 Outware Mobile. All rights reserved.

import XCTest

/// Permissions dialog types
public enum PermissionType {

  /// Calendar Permissions
  case calendar

  /// Camera permissions
  case camera

  /// Location permissions for when in use
  case locationServiceWhenInUse

  /// Location permissions for always and when in use
  case locationServiceAlwaysAndWhenInUse(LocationServiceButton)

  /// Photo library permissions
  case photoLibrary

  /// Reminders
  case reminders

  /// Location Service button for always and when in use alert.
  ///
  /// When requesting user's location with `CLLocation.requestAlwaysAuthorization()`, an alert with 3 buttons will be shown:
  /// 1. Allow always
  /// 2. Allow when in use
  /// 3. Do not allow
  ///
  /// This enum should be used in order to know which button to tap on.
  public enum LocationServiceButton {

    /// Always allow button
    case always

    /// When in use button
    case whenInUse

    fileprivate var allowIdentifier: String {
      switch self {
      case .always: return "Always Allow"
      case .whenInUse: return "Only While Using the App"
      }
    }
  }

  fileprivate var allowIdentifier: String {
    switch self {
    case .calendar, .camera, .photoLibrary, .reminders: return "OK"
    case .locationServiceWhenInUse: return "Allow"
    case let .locationServiceAlwaysAndWhenInUse(button): return button.allowIdentifier
    }
  }

  fileprivate var denyIdentifier: String {
    switch self {
    case .calendar, .camera, .locationServiceWhenInUse, .locationServiceAlwaysAndWhenInUse, .photoLibrary, .reminders: return "Don’t Allow"
    }
  }
}

extension XCUIApplication {

  private var springBoardApplication: XCUIApplication {
    return .init(bundleIdentifier: "com.apple.springboard")
  }

  /// Accept permissions if a permission request dialog is displayed
  ///
  /// - Parameters:
  ///     - permissionType: the type of permission being requested
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func acceptPermissionIfRequired(
    for permissionType: PermissionType,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    guard springBoardApplication.first(element: .init(type: .alert), failable: false, timeout: timeout, file: file, line: line).exists else { return }

    springBoardApplication.tap(element: .init(type: .alertButton, identifier: permissionType.allowIdentifier), timeout: timeout, file: file, line: line)
  }

  /// Deny permissions if a permission request dialog is displayed
  ///
  /// - Parameters:
  ///     - permissionType: the type of permission being requested
  ///     - expectation: the expectation to fulfill
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func denyPermissionIfRequired(
    for permissionType: PermissionType,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    guard springBoardApplication.first(element: .init(type: .alert), failable: false, timeout: timeout, file: file, line: line).exists else { return }

    springBoardApplication.tap(element: .init(type: .alertButton, identifier: permissionType.denyIdentifier), timeout: timeout, file: file, line: line)
  }
}
