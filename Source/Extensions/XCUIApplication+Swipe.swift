//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Swipe towards element in a scrollable element
  ///
  /// - parameters:
  ///     - element: the struct containing details of the `XCUIElement` contained in `scrollableElement` to swipe to
  ///     - scrollableElement: the struct containing details of a scrollable `XCUIElement`
  ///     - direction: the swiping direction
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func swipe(
    to element: Element,
    in scrollableElement: Element,
    direction: Direction,
    maxSwipeCount: UInt = 10,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let uiElement: XCUIElement = first(element: element, timeout: timeout, file: file, line: line)
    let scrollableElement: XCUIElement = first(element: scrollableElement, timeout: timeout, file: file, line: line)

    var swipeCount: UInt = 0
    while !uiElement.isVisible && swipeCount < maxSwipeCount {
      scrollableElement.swipe(withDirection: direction)
      swipeCount += 1
    }

    assert(
      swipeCount != maxSwipeCount,
      message: "Unable to make element '\(element)' visible after '\(swipeCount)' attempts when scrolling '\(direction)'",
      file: file,
      line: line
    )
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
