//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Swiping directions.
  ///
  /// **Notes**: the swiping direction will scroll the table in the opposite direction
  enum Direction {

    /// Scrolls down
    case up

    /// Scrolls left
    case right

    /// Scrolls up
    case down

    /// Scrolls right
    case left
  }

  /// Swipe to the given cell index in a table towards a `Direction`.
  ///
  /// - parameters:
  ///     - cellIndex: the index of the cell to swipe to
  ///     - tableIdentifier: the identifier of table
  ///     - direction: the swiping direction
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  func swipe(
    to cellIndex: Int,
    in tableIdentifier: String,
    direction: Direction,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let cell: XCUIElement = first(.cell, atIndex: cellIndex, file: file, line: line)
    let table: XCUIElement = first(.table, withIdentifier: tableIdentifier, file: file, line: line)

    while !cell.isVisible {
      switch direction {
      case .up: table.swipeUp()
      case .right: table.swipeRight()
      case .down: table.swipeDown()
      case .left: table.swipeLeft()
      }
    }
  }
}
