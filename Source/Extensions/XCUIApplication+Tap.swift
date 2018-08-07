//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Location Area
  ///
  /// **Notes**:
  /// We can tap a specific area of an element by calculating a vector based on its size
  public enum Area {
    
    // CGVectors require dx and dy values to calculate where has been tapped
    // dx is a percentage of pixels, measured from the left-hand side
    // dy is a percentage of pixels, measured from the top side
    var vector: CGVector {
      switch self {
      case .right: return CGVector(dx: 0.95, dy: 0.5)
      case .left: return CGVector(dx: 0.05, dy: 0.5)
      }
    }
    
    // Align horizontally to the right side (95%/0.95) and vertically to the mid point (50%/0.5)
    case right
    
    // Align horizontally to the left side (5%/0.05) and vertically to the mid point (50%/0.5)
    case left
  }
  
  /// Tap on element with given type and index.
  ///
  /// - parameters:
  ///     - elementType: the type of the element
  ///     - index: the index of the element
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func tap(_ elementType: Robocop.ElementType, atIndex index: Int, file: StaticString = #file, line: UInt = #line) {
    first(elementType, atIndex: index, file: file, line: line).tap()
  }

  /// Tap on element with given type and identifier.
  ///
  /// - parameters:
  ///     - elementType: the type of the element
  ///     - identifer: the identifer of the element
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func tap(_ elementType: Robocop.ElementType, withIdentifier identifer: String, file: StaticString = #file, line: UInt = #line) {
    first(elementType, withIdentifier: identifer, file: file, line: line).tap()
  }
  
  /// Tap on element with given type and side
  ///
  /// - parameters:
  ///     - elementType: the type of the element
  ///     - identifier: the identifier of the element
  ///     - area: the area of the element that was tapped
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func tap(_ elementType: Robocop.ElementType, withIdentifier identifier: String, withArea area: Area, file: StaticString = #file, line: UInt = #line) {
    first(elementType, withIdentifier: identifier).coordinate(withNormalizedOffset: area.vector).tap()
  }
}
