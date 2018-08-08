//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Find the first matching `XCUIElement` with the given `ElementType`
  ///
  /// - parameters:
  ///     - elementType: the type of the element to find
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  ///
  /// - returns: First matching element (using `firstMatch` to stop once an element is found)
  public func first(
    _ elementType: Robocop.ElementType,
    file: StaticString = #file,
    line: UInt = #line
  ) -> XCUIElement {
    let element: XCUIElement = query(for: elementType).element.firstMatch

    assert(
      element.exists,
      message: "No element \(elementType) found.",
      file: file,
      line: line
    )

    return element
  }
  /// Find the first matching `XCUIElement` with the given `ElementType` and identifier.
  ///
  /// - parameters:
  ///     - elementType: the type of the element to find
  ///     - identifier: the identifier of the element to find
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  ///
  /// - returns: First matching element (using `firstMatch` to stop once an element is found)
  public func first(
    _ elementType: Robocop.ElementType,
    withIdentifier identifier: String,
    file: StaticString = #file,
    line: UInt = #line
  ) -> XCUIElement {
    let element: XCUIElement = query(for: elementType)[identifier].firstMatch

    assert(
      element.exists,
      message: "No element \(elementType) with identifier '\(identifier)' found.",
      file: file,
      line: line
    )

    return element
  }

  /// Find the first matching `XCUIElement` with the given `ElementType` and index.
  ///
  /// - parameters:
  ///     - elementType: the type of the element to find
  ///     - index: the index of the element to find
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  ///
  /// - returns: First matching element (using `firstMatch` to stop once an element is found)
  public func first(
    _ elementType: Robocop.ElementType,
    atIndex index: Int,
    file: StaticString = #file,
    line: UInt = #line
  ) -> XCUIElement {
    let element: XCUIElement = query(for: elementType).element(boundBy: index).firstMatch

    assert(
      element.exists,
      message: "No element \(elementType) at index '\(index)' found.",
      file: file,
      line: line
    )

    return element
  }
}
