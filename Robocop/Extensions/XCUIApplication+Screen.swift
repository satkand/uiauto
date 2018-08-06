//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Return the element which contains the navigation bar title.
  ///
  /// Elements that are part of the navigation bar do not have accessibility identifiers,
  /// the accessibility label is used instead.
  ///
  /// - parameters:
  ///     - title: the accessibility label to look for
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  ///
  /// - returns: element with the given title
  func screen(withTitle title: String, file: StaticString = #file, line: UInt = #line) -> XCUIElement {
    return first(.navigationBarTitle, withIdentifier: title, file: file, line: line)
  }
}
