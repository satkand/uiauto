//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Verify the existence of an element.
  ///
  /// - parameters:
  ///     - elementType: the type of element
  ///     - identifier: the identifier of the element
  ///     - timeout: the timeout value to stop the query
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func verifyExistence(
    ofElement elementType: Robocop.ElementType,
    withIdentifier identifier: String,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    _ = first(elementType, withIdentifier: identifier, file: file, line: line)
      .waitForExistence(timeout: timeout)
  }

  /// Verify the value of an element.
  ///
  /// - parameters:
  ///     - expectedValue: the expected value
  ///     - elementType: the type of element
  ///     - elementIdentifier: the identifier of the element
  ///     - timeout: the timeout value to stop the query
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func verifyText(
    _ expectedText: String,
    inElement elementType: Robocop.ElementType,
    withIdentifier elementIdentifier: String,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let element: XCUIElement = first(elementType, withIdentifier: elementIdentifier, file: file, line: line)
    let actualValue: String = element.value as! String
    assert(expectedText == actualValue, message: "Expected \(expectedText), found \(actualValue)", file: file, line: line)
  }
}
