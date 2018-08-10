//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Swipe to the given cell index in a table towards a `Direction`.
  ///
  /// - parameters:
  ///     - cellIndex: the index of the cell to swipe to
  ///     - tableIdentifier: the identifier of table
  ///     - direction: the swiping direction
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func swipe(
    to cellIndex: Int,
    in tableIdentifier: String,
    direction: Direction,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let cell: XCUIElement = first(element: .init(type: .cell, index: cellIndex), file: file, line: line)
    let table: XCUIElement = first(element: .init(type: .table, identifier: tableIdentifier), file: file, line: line)

    while !cell.isVisible {
      table.swipe(withDirection: direction)
    }
  }

  /// Swipe an element towards a 'Direction'
  ///
  /// - parameters:
  ///     - element: the struct containing details of the `XCUIElement` to find
  ///     - direction: the swiping direction
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func swipe(element: Element, direction: Direction, file: StaticString = #file, line: UInt = #line) {
    first(element: element).swipe(withDirection: direction)
  }
}
