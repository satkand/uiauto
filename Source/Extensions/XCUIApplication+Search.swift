//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Input search text into search bar with given search bar identifier.
  ///
  /// - parameters:
  ///     - text: the text to input into the search bar
  ///     - identifier: the identifier of the search bar
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func search(text: String, inSearchBar identifier: String, file: StaticString = #file, line: UInt = #line) {

    let elementType: Robocop.ElementType = .searchBar(type: .searchField, identifier: identifier)
    let searchField: XCUIElement = first(element: .init(type: elementType), file: file, line: line)

    searchField.tap()
    searchField.typeText(text)
  }

  /// Clear text in search bar with given search bar identifier.
  ///
  /// - parameters:
  ///     - identifier: the identifier of the search bar
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func clearText(inSearchBar identifier: String, file: StaticString = #file, line: UInt = #line) {
    let elementType: Robocop.ElementType = .searchBar(type: .clearButton, identifier: identifier)
    first(element: .init(type: elementType, identifier: "Clear text"), file: file, line: line).tap()
  }
}
