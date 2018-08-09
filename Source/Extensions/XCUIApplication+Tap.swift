//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Location Area
  ///
  /// **Notes**:
  /// We can tap a specific area of an element by calculating a vector based on its size
  public enum Area {

    // Centered horizontally and vertically (50%/0.5, 50%/0.5)
    case center

    // Align horizontally to the left side (5%/0.05) and vertically to the mid point (50%/0.5)
    case left

    // Align horizontally to the right side (95%/0.95) and vertically to the mid point (50%/0.5)
    case right

    // CGVectors require dx and dy values to calculate where has been tapped
    // dx is a percentage of pixels, measured from the left-hand side
    // dy is a percentage of pixels, measured from the top side
    var vector: CGVector {
      switch self {
      case .center: return CGVector(dx: 0.5, dy: 0.5)
      case .left: return CGVector(dx: 0.05, dy: 0.5)
      case .right: return CGVector(dx: 0.95, dy: 0.5)
      }
    }
  }

  /// Tap on element in the given area.
  ///
  /// - parameters:
  ///     - element: the struct containing details of the `XCUIElement` to find
  ///     - area: the area of the element that was tapped (defaults to tapping in the center)
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func tap(element: Element, inArea area: Area = .center, timeout: TimeInterval = 0, file: StaticString = #file, line: UInt = #line) {
    first(element: element, timeout: timeout, file: file, line: line).coordinate(withNormalizedOffset: area.vector).tap()
  }
}
