//  Copyright © 2018 Outware Mobile. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Permissions dialog types
  public enum PermissionType {

    /// Camera permissions
    case camera

    /// Photo library permissions
    case photos

    fileprivate var allowIdentifier: String {
      switch self {
      case .camera, .photos: return "OK"
      }
    }

    fileprivate var denyIdentifier: String {
      switch self {
      case .camera, .photos: return "Don’t Allow"
      }
    }
  }

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
