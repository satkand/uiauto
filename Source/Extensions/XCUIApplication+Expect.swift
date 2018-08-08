//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Expectations that can be validated on a `XCUIElement`
  public enum Expectation {

    /// The element exists or not
    case exist(Bool)

    /// The element's value is a boolean and its value
    case haveBool(Bool)

    /// The element's value is a string and its value
    case haveText(String)

    /// The element is enabled or not
    case beEnabled(Bool)

    /// The element is hittable or not
    case beHittable(Bool)

    /// The element is selected or not
    case beSelected(Bool)

    /// The element is visible or not
    case beVisible(Bool)
  }

  /// Expect an element to fulfill given expectation.
  ///
  /// - parameters:
  ///     - element: the struct containing details of the `XCUIElement` to find
  ///     - expectation: the expectation to fulfill
  ///     - timeout: the timeout value to stop the query
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func expect(
    element: Element,
    to expectation: Expectation,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let uiElement: XCUIElement = first(element: element, failable: false, timeout: timeout, file: file, line: line)

    let errorMessage: String
    let result: Bool

    switch expectation {

    case let .exist(expectedBool):
      // Waiting for existence is already done as part of finding the element using `first`
      result = uiElement.exists == expectedBool
      errorMessage = "Expected element to '\(expectation)', got \(uiElement.exists)"

    case let .haveBool(expectedBool):
      let currentBool: Bool? = (uiElement.value as? String)?.asBool
      result = currentBool == expectedBool
      errorMessage = "Expected element to '\(expectation)', got \(String(describing: uiElement.value))"

    case let .haveText(expectedText):
      let currentText: String = (uiElement.value as? String) ?? ""
      result = currentText == expectedText
      errorMessage = "Expected element to \(expectation), got \(String(describing: uiElement.value))"

    case let .beEnabled(expectedBool):
      result = uiElement.isEnabled == expectedBool
      errorMessage = "Expected element to \(expectation), got \(uiElement.isEnabled)"

    case let .beHittable(expectedBool):
      result = uiElement.isHittable == expectedBool
      errorMessage = "Expected element to \(expectation), got \(uiElement.isHittable)"

    case let .beSelected(expectedBool):
      result = uiElement.isSelected == expectedBool
      errorMessage = "Expected element to \(expectation), got \(uiElement.isSelected)"

    case let .beVisible(expectedBool):
      result = uiElement.isVisible == expectedBool
      errorMessage = "Expected element to \(expectation), got \(uiElement.isVisible)"
    }

    assert(result, message: errorMessage, file: file, line: line)
  }
}

private extension String {

  var asBool: Bool? {
    switch self.lowercased() {
    case "true", "1": return true
    case "false", "0": return false
    default: return nil
    }  }
}
