//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {
  /// Location Area
  ///
  /// **Notes**:
  /// We can tap a specific area of an element by calculating a vector based on its size
  public enum Area {
    /// Horizontally (99%/0.99) and vertically (99%/0.99)
    case bottomRight

    /// Centered horizontally and vertically (50%/0.5, 50%/0.5)
    case center

    /// Align horizontally to the left side (5%/0.05) and vertically to the mid point (50%/0.5)
    case left

    /// Align horizontally to the right side (95%/0.95) and vertically to the mid point (50%/0.5)
    case right

    /// Horizontally (1%/0.01) and vertically (1%/0.01)
    case topLeft

    /// Align horizontally to the mid point (50%/0.5) and vertically to the top side (5%/0.05)
    case top

    /// Align horizontally to the mid point (50%/0.5) and vertically to the bottom side (95%/0.95)
    case bottom

    /// Returns a position that represents the area relative to the element's size.
    var position: NormalizedPosition {
      switch self {
      case .bottomRight: return NormalizedPosition(x: 0.99, y: 0.99)
      case .center: return NormalizedPosition(x: 0.5, y: 0.5)
      case .left: return NormalizedPosition(x: 0.05, y: 0.5)
      case .right: return NormalizedPosition(x: 0.95, y: 0.5)
      case .topLeft: return NormalizedPosition(x: 0.01, y: 0.01)
      case .top: return NormalizedPosition(x: 0.5, y: 0.05)
      case .bottom: return NormalizedPosition(x: 0.5, y: 0.95)
      }
    }
  }

  /// Tap on element in the given area.
  ///
  /// - Parameters:
  ///     - element: the struct containing details of the `XCUIElement` to find
  ///     - area: the area of the element that was tapped (defaults to tapping in the center)
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func tap(
    element: Element,
    in area: Area = .center,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    coordinate(for: element, in: area, timeout: timeout, file: file, line: line)?.tap()
  }

  /// Double tap on element in the given area.
  ///
  /// - Parameters:
  ///     - element: the struct containing details of the `XCUIElement` to find
  ///     - area: the area of the element that was tapped (defaults to tapping in the center)
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func doubleTap(
    element: Element,
    in area: Area = .center,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    coordinate(for: element, in: area, timeout: timeout, file: file, line: line)?.doubleTap()
  }

  private func coordinate(
    for element: Element,
    in area: Area = .center,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) -> XCUICoordinate? {
    let element: XCUIElement = first(element: element, timeout: timeout, file: file, line: line)

    guard element.exists else { return nil }

    return element.coordinate(withNormalizedOffset: area.position.vector)
  }
}
