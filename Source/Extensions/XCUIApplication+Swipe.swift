//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Swipe towards element in a scrollable element
  ///
  /// - parameters:
  ///     - element: the struct containing details of the `XCUIElement` contained in `scrollableElement` to swipe to
  ///     - scrollableElement: the struct containing details of a scrollable `XCUIElement`
  ///     - maxSwipeCount: the maximum number of swipes. Defaults to 10 as it would otherwise indefinitely swipe.
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
    let elementToShow: XCUIElement = first(element: element, timeout: timeout, file: file, line: line)

    let offset: CGVector = CGVector(dx: 0.4, dy: 0.4)
    let startPosition: NormalizedPosition = .center
    let endPosition: NormalizedPosition = startPosition.offset(by: offset.scaled(by: direction.vector))

    var swipeCount: Int = 0
    while !elementToShow.isVisible && swipeCount < maxSwipeCount {
      // We're using drag here because it gives us more control over how much gets scrolled for each "swipe".
      // With the provided `swipe` function, the view would scroll past the element, failing to locate it even though it exists.
      drag(element: scrollableElement, from: startPosition, to: endPosition, timeout: timeout, file: file, line: line)

      swipeCount += 1
    }

    assert(
      swipeCount != maxSwipeCount,
      message: "Unable to make element '\(element)' visible after '\(swipeCount)' attempts while scrolling '\(direction)'",
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

private extension CGVector {

  func scaled(by scale: CGVector) -> CGVector {
    return CGVector(dx: dx * scale.dx, dy: dy * scale.dy)
  }
}
