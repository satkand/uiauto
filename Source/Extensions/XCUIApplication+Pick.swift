//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {
  /// Select wheel value in an element
  ///
  /// - parameters:
  ///     - wheelValue: the value to be set on the wheel
  ///     - element: the element to apply the drag gesture to
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func pick(
    _ wheelValue: String,
    in element: Element,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    first(element: element, timeout: timeout, file: file, line: line).adjust(toPickerWheelValue: wheelValue)
  }

  /// Select value in the specified wheel of an element
  ///
  /// - parameters:
  ///     - wheelValue: the value to be set on the wheel
  ///     - wheelIndex: the index of the wheel to adjust
  ///     - element: the element to apply the drag gesture to
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func pick(
    _ wheelValue: String,
    inWheelIndex wheelIndex: Int,
    inElement element: Element,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    first(element: element, timeout: timeout, file: file, line: line)
      .first(element: .init(type: .pickerWheel, index: wheelIndex), timeout: timeout, file: file, line: line)
      .adjust(toPickerWheelValue: wheelValue)
  }
}
