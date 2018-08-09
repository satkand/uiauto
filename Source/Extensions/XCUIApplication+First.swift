//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Find the first matching `XCUIElement` with the given `Element`.
  ///
  /// An `XCUIElement` can be found by using their identifier (which is the accessibility identifier or label),
  /// index or type.
  ///
  /// This function will first attempt to make a match using the identifier if available.
  /// If no identifier is given, the index will be used if available.
  /// Otherwise, it will return the first element matching the given type
  ///
  /// **Notes**
  ///
  /// It is always preferred to use the identifier as it is more robust than relying on an index or just on the type.
  /// In the ideal case, one would want to ensure that each identifiers are **unique** per screen.
  ///
  /// - parameters:
  ///     - element: the struct containing details of the `XCUIElement` to find
  ///     - failable: the flag depicting if this function should fail the tests if the element does not exist (defaults to `true`)
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  ///
  /// - returns: First matching element (using `firstMatch` to stop once an element is found)
  public func first(element: Element, failable: Bool = true, timeout: TimeInterval = 0, file: StaticString = #file, line: UInt = #line) -> XCUIElement {

    let uiElement: XCUIElement
    let errorMessage: String

    if let identifier = element.identifier {
      uiElement = query(for: element.type)[identifier].firstMatch
      errorMessage = "No element \(element.type) with identifier '\(identifier)' found."
    } else if let index = element.index {
      uiElement = query(for: element.type).element(boundBy: index).firstMatch
      errorMessage = "No element \(element.type) at index '\(index)' found."
    } else {
      uiElement = query(for: element.type).element.firstMatch
      errorMessage = "No element \(elementType) found."
    }

    if failable {
      assert(uiElement.waitForExistence(timeout: timeout), message: errorMessage, file: file, line: line)
    } else {
      _ = uiElement.waitForExistence(timeout: timeout)
    }

    return uiElement
  }
}
