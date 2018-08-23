//  Copyright © 2018 Outware Mobile. All rights reserved.

import XCTest

extension XCUIApplication {
  /// Initiates a drag gesture starting at the start position and finishing at the end position. The positions are
  /// relative to the given element's size.
  ///
  /// - Parameters:
  ///   - element: the element to apply the drag gesture to
  ///   - startPosition: the position relative to the element's size to start the drag gesture
  ///   - endPosition: the position relative to the element's size to finish the drag gesture
  ///   - timeout: the specified amount of time to wait for the element to exist
  ///   - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called
  ///   - line: the line number on which failure occurred. Defaults to the line number on which this function was called
  public func drag(
    element: Element,
    from startPosition: NormalizedPosition,
    to endPosition: NormalizedPosition,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    press(
      element: element,
      at: startPosition,
      forDuration: 0.25,
      thenDragTo: endPosition,
      timeout: timeout,
      file: file,
      line: line
    )
  }
}
