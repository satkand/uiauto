//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Read the accessibility label from the element with given type and identifier.
  ///
  /// - parameters:
  ///     - element: the struct containing details of the `XCUIElement` to find
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  ///
  /// - returns: Accessibility label of element
  public func readText(from element: Element, file: StaticString = #file, line: UInt = #line) -> String? {
    return first(element: element, file: file, line: line).value as? String
  }
}
