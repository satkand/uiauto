//  Copyright © 2018 Outware Mobile. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Attempts to scroll the given element to the specified area. If the element is not scrollable, it won't do
  /// anything.
  ///
  /// **Note**
  ///
  /// Scrolling to the `center` will only work if it has to scroll down to get to the center of the element. If
  /// scrolling up is required, scroll all the way up first before scrolling to the center as a workaround.
  ///
  /// - Parameters:
  ///   - element: the element to scroll
  ///   - area: the area of the element to scroll to
  ///   - timeout: the specified amount of time to wait for the element to exist
  ///   - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called
  ///   - line: the line number on which failure occurred. Defaults to the line number on which this function was called
  public func scroll(
    element: Element,
    to area: Area,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let endPosition: NormalisedPosition = area.position.inverted
    scroll(element: element, to: endPosition, timeout: timeout, file: file, line: line)
  }

  private func scroll(
    element: Element,
    to endPosition: NormalisedPosition,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let startPosition: NormalisedPosition = startingPosition(whenScrollingTo: endPosition)
    drag(element: element, from: startPosition, to: endPosition, timeout: timeout, file: file, line: line)
  }

  private func startingPosition(whenScrollingTo endPosition: NormalisedPosition) -> NormalisedPosition {
    let startX: CGFloat = startingPoint(whenScrollingTo: endPosition.x)
    let startY: CGFloat = startingPoint(whenScrollingTo: endPosition.y)
    return NormalisedPosition(x: startX, y: startY)
  }

  /// Returns the start point to be able to scroll to the given end point.
  ///
  /// **Note**
  ///
  /// Given the reference line:
  /// ```
  ///  |----|----|----|----|----|----|----|----|----|----|
  /// 0.0  0.1  0.2  0.3  0.4  0.5  0.6  0.7  0.8  0.9  1.0
  /// ```
  ///
  /// If we want to drag to a position that is above 0.5, in order to have enough scrolling, we want to start at a
  /// point behind the mid line.
  /// ```
  ///  |----|----|----|----|----|----|----|----|----|----|
  /// 0.0  0.1  0.2  0.3  0.4  0.5  0.6  0.7  0.8  0.9  1.0
  ///            |------------------>|--->|--->|--->|--->|
  /// ```
  ///
  /// Similarly, if we want to drag to a position that is below 0.5, we want to start after the mid point.
  /// ```
  ///  |----|----|----|----|----|----|----|----|----|----|
  /// 0.0  0.1  0.2  0.3  0.4  0.5  0.6  0.7  0.8  0.9  1.0
  ///  |<---|<---|<---|<---|<------------------|
  /// ```
  ///
  /// Those specific values were chosen through trial and error to be far enough from the edges to prevent triggering
  /// device gestures such as showing the notification centre or the control centre, and also far enough that there
  /// is still bounce but not too much that it disrupts the tests.
  ///
  /// - Parameters:
  ///   - endPoint: the point where the scroll gesture ends
  ///
  /// - Returns: the point where the scroll gesture should start
  private func startingPoint(whenScrollingTo endPoint: CGFloat) -> CGFloat {
    return isPositiveDirection(whenScrollingTo: endPoint) ? 0.2 : 0.8
  }

  private func isPositiveDirection(whenScrollingTo endPoint: CGFloat) -> Bool {
    // Scrolling to the `center` only works when you have to scroll down to get to it because there is currently
    // no way to know the current position. As such, if center (or 0.5) is required, we will use a negative direction.
    return endPoint > 0.5
  }
}
