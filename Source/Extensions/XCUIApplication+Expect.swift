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
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func expect(
    element: Element,
    to expectation: Expectation,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let buildErrorMessage: (Any?) -> String = { actualValue in
      "Expected element to '\(expectation)', got \(String(describing: actualValue))"
    }

    let uiElement: XCUIElement = first(element: element, failable: false, timeout: timeout, file: file, line: line)

    let errorMessage: String
    let result: Bool

    switch expectation {

    case let .exist(expectedBool):
      // Waiting for existence is already done as part of finding the element using `first`
      result = uiElement.exists == expectedBool
      errorMessage = buildErrorMessage(uiElement.exists)

    case let .haveBool(expectedBool):
      let currentBool: Bool? = (uiElement.value as? String)?.asBool
      result = currentBool == expectedBool
      errorMessage = buildErrorMessage(currentBool)

    case let .haveText(expectedText):
      let currentText: String? = readText(from: element)
      result = currentText == expectedText
      errorMessage = buildErrorMessage(currentText)

    case let .beEnabled(expectedBool):
      result = uiElement.isEnabled == expectedBool
      errorMessage = buildErrorMessage(uiElement.isEnabled)

    case let .beHittable(expectedBool):
      result = uiElement.isHittable == expectedBool
      errorMessage = buildErrorMessage(uiElement.isHittable)

    case let .beSelected(expectedBool):
      result = uiElement.isSelected == expectedBool
      errorMessage = buildErrorMessage(uiElement.isSelected)

    case let .beVisible(expectedBool):
      result = uiElement.isVisible == expectedBool
      errorMessage = buildErrorMessage(uiElement.isVisible)
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
    }
  }
}
