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
  func drag(
    element: Element,
    from startPosition: NormalisedPosition,
    to endPosition: NormalisedPosition,
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

  /// Initiates a press-and-hold gesture at the start position for the given durantion before dragging to the end
  /// position. The positions are relative to the given element's size.
  ///
  /// - Parameters:
  ///   - element: the element to apply the gesture to
  ///   - startPosition: the position relative to the element's size to start the press-and-hold gesture
  ///   - duration: the duration of the press-and-hold gesture
  ///   - endPosition: the position relative to the element's size to finish the drag gesture
  ///   - timeout: the specified amount of time to wait for the element to exist
  ///   - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called
  ///   - line: the line number on which failure occurred. Defaults to the line number on which this function was called
  func press(
    element: Element,
    at startPosition: NormalisedPosition,
    forDuration duration: TimeInterval,
    thenDragTo endPosition: NormalisedPosition,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let element: XCUIElement = first(element: element, timeout: timeout, file: file, line: line)
    let startCoordinate: XCUICoordinate = element.coordinate(withNormalizedOffset: startPosition.vector)
    let endCoordinate: XCUICoordinate = element.coordinate(withNormalizedOffset: endPosition.vector)

    startCoordinate.press(forDuration: duration, thenDragTo: endCoordinate)
  }
}
