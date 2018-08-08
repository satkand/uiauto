//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Tap on element with given type and index.
  ///
  /// - parameters:
  ///     - elementType: the type of the element
  ///     - index: the index of the element
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func tap(element: Element, file: StaticString = #file, line: UInt = #line) {
    first(element: element, file: file, line: line).tap()
  }
}
