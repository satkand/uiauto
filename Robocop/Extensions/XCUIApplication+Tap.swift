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
  func tap(_ elementType: Robocop.ElementType, atIndex index: Int, file: StaticString = #file, line: UInt = #line) {
    first(elementType, atIndex: index, file: file, line: line).tap()
  }

  /// Tap on element with given type and identifier.
  ///
  /// - parameters:
  ///     - elementType: the type of the element
  ///     - identifer: the identifer of the element
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  func tap(_ elementType: Robocop.ElementType, withIdentifier identifer: String, file: StaticString = #file, line: UInt = #line) {
    first(elementType, withIdentifier: identifer, file: file, line: line).tap()
  }
}
