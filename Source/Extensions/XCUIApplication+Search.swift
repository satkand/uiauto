//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Input search text into search bar with given search bar identifier.
  ///
  /// - parameters:
  ///     - text: the text to input into the search bar
  ///     - identifier: the identifier of the search bar
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func search(text: String, inSearchBar identifier: String, timeout: TimeInterval = 0, file: StaticString = #file, line: UInt = #line) {

    let searchField: XCUIElement = first(element: .init(type: .searchBar, identifier: identifier), file: file, line: line)
      .children(matching: .searchField)
      .firstMatch

    _ = searchField.waitForExistence(timeout: timeout)

    assertElementExists(searchField, file: file, line: line)

    searchField.tap()
    searchField.typeText(text)
  }

  /// Clear text in search bar with given search bar identifier.
  ///
  /// - parameters:
  ///     - identifier: the identifier of the search bar
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func clearText(inSearchBar identifier: String, timeout: TimeInterval = 0, file: StaticString = #file, line: UInt = #line) {
    let clearButton: XCUIElement = first(element: .init(type: .searchBar, identifier: identifier), file: file, line: line)
      .buttons["Clear text"]
      .firstMatch

    _ = clearButton.waitForExistence(timeout: timeout)

    assertElementExists(clearButton, file: file, line: line)

    clearButton.tap()
  }
}
