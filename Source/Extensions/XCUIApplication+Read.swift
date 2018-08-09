//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Read the text from an element with given type and identifier.
  ///
  /// **Note:**
  ///
  /// In some cases, (e.g.: `UILabel`), the `accessibilityValue` of the element is not set automatically.
  /// For those, the `label` property is being used to determine the text being displayed.
  ///
  /// If the `accessibilityLabel` on those are customised, it is advised to also set the `accessibilityValue` to
  /// the actual text so that the UI tests are able to verify it.
  ///
  /// - parameters:
  ///     - element: the struct containing details of the `XCUIElement` to find
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  ///
  /// - returns: the accessibility value of an element if found, otherwise the accessibility label
  public func readText(from element: Element, file: StaticString = #file, line: UInt = #line) -> String? {
    let element: XCUIElement = first(element: element, file: file, line: line)

    if let value: String = element.value as? String, !value.isEmpty {
      return value
    } else {
      return element.label
    }
  }
}
