//  Copyright © 2018 Outware Mobile. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Adjust slider to a given percentage
  ///
  /// It is **recommended** to test sliders with this functionality first
  /// In the testing suite this has been **failing tests** but is the documented method to adjust sliders
  /// It is worth attempting this method first before using the below workaround
  ///
  /// - parameters:
  ///     - element: the struct containing details of the `XCUIElement` to find
  ///     - percent: the position to slide to with 0 being empty and 1 being full
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func slide(
    element: Element,
    toPercent percent: CGFloat,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let element: XCUIElement = first(element: element, timeout: timeout, file: file, line: line)
    guard element.exists else { return }
    element.adjust(toNormalizedSliderPosition: percent)
  }

  /// Manually press and drag to adjust slider to a given percentage
  ///
  /// This functionality is a **workaround** to mimic the slide functionality of
  /// a slider (.adjust(toNormalizedSliderPosition: percent)) by
  /// manually pressing and dragging the slider to a set percentage
  ///
  /// It is **not 100%** accurate due to the value of the slider not exactly matching the percent of the coordinate set
  /// This means that often the percent dragged to is slightly higher than the one set due to rounding errors
  /// The tests will needed to be adjusted manually to account for this
  ///
  /// - parameters:
  ///     - element: the struct containing details of the `XCUIElement` to find
  ///     - startPercent: the starting position the slider is set to
  ///     - endPercent: the final position we want our slider to finish at
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func slide(
    element: Element,
    startPercent: CGFloat,
    endPercent: CGFloat,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    drag(
      element: element,
      from: NormalisedPosition(x: startPercent, y: 0.5),
      to: NormalisedPosition(x: endPercent, y: 0.5),
      timeout: timeout,
      file: file,
      line: line
    )
  }
}
