//  Copyright © 2018 Apple. All rights reserved.

import XCTest

/// Empty protocol which can be used to check if an element has a specific "value"
public protocol Value {}

extension Bool: Value {}

extension String: Value {}

extension XCUIApplication {

  public enum Expectation {
    case exist
    case haveValue(Value)
    case beEnabled
    case beHittable
    case beSelected
    case beVisible
  }

//  public func expect(element: Element, to expectation: Expectation, timeout: TimeInterval = 0, file: StaticString = #file, line: UInt = #line) {
//    first(element).
//  }

  /// Verify the existence of an element.
  ///
  /// - parameters:
  ///     - element: the struct containing details of the `XCUIElement` to find
  ///     - timeout: the timeout value to stop the query
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func verifyExistence(
    ofElement element: Element,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    _ = first(element: element, file: file, line: line).waitForExistence(timeout: timeout)
  }

  /// Verify the value of an element.
  ///
  /// - parameters:
  ///     - expectedText: the expected value
  ///     - element: the struct containing details of the `XCUIElement` to find
  ///     - timeout: the timeout value to stop the query
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func verifyText(
    _ expectedText: String,
    inElement element: Element,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let uiElement: XCUIElement = first(element: element, file: file, line: line)
    let actualValue: String = uiElement.value as! String
    assert(expectedText == actualValue, message: "Expected \(expectedText), found \(actualValue)", file: file, line: line)
  }
}
