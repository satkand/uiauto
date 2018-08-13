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
  public func search(
    text: String,
    inSearchBar identifier: String,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let element: Element = .init(type: .searchBar, identifier: identifier)
    let searchBar: XCUIElement = first(element: element, timeout: timeout, file: file, line: line)
    let searchField: XCUIElement = searchBar.first(element: .init(type: .searchField), timeout: timeout, file: file, line: line)

    guard searchBar.exists && searchField.exists else { return }

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
    let searchBarElement: Element = .init(type: .searchBar, identifier: identifier)
    let searchBar: XCUIElement = first(element: searchBarElement, timeout: timeout, file: file, line: line)

    let clearButtonElement: Element = .init(type: .button, identifier: "Clear text")
    let clearButton: XCUIElement = searchBar.first(element: clearButtonElement, timeout: timeout, file: file, line: line)

    guard searchBar.exists && clearButton.exists else { return }

    clearButton.tap()
  }
}
