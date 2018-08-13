//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Swipe to the given cell index in a table towards a `Direction`.
  ///
  /// - parameters:
  ///     - cellIndex: the index of the cell to swipe to
  ///     - tableIdentifier: the identifier of table
  ///     - direction: the swiping direction
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func swipe(
    to cellIndex: Int,
    in tableIdentifier: String,
    direction: Direction,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let cell: XCUIElement = first(element: .init(type: .cell, index: cellIndex), timeout: timeout, file: file, line: line)
    let table: XCUIElement = first(element: .init(type: .table, identifier: tableIdentifier), timeout: timeout, file: file, line: line)

    guard table.exists && cell.exists else { return }

    while !cell.isVisible {
      table.swipe(withDirection: direction)
    }
  }

  /// Swipe an element towards a 'Direction'
  ///
  /// - parameters:
  ///     - element: the struct containing details of the `XCUIElement` to find
  ///     - direction: the swiping direction
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func swipe(
    element: Element,
    direction: Direction,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let element: XCUIElement = first(element: element, timeout: timeout, file: file, line: line)

    guard element.exists else { return }

    element.swipe(withDirection: direction)
  }
}
