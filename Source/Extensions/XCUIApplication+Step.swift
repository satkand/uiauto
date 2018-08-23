//  Copyright © 2018 Outware Mobile. All rights reserved.

import XCTest

extension XCUIApplication {
  /// Enum representing the increment or decrement button in a stepper
  public enum StepButton {
    /// The increment button
    case up

    /// The decrement button
    case down

    /// A stepper is not accessible by default. Making them accessible is also not a good solution
    /// as it would mean they would be exposed to the user as an accessible element (which it is not).
    ///
    /// The current solution aims at finding the buttons with an `accessibilityLabel` of "Increment" or "Decrement" and
    /// then find the right one using the index of the stepper.
    ///
    /// - paramaters:
    ///     - query: the query to find the increment or decrement buttons
    ///     - index: the index of the stepper itself (not the individual buttons)
    ///
    /// - returns: the `XCUIElement` representing the step button on the screen
    internal func elementFromQuery(_ query: XCUIElementQuery, at index: Int) -> XCUIElement {
      switch self {
      case .up:
        return query.allElementsBoundByIndex.filter { $0.label == "Increment" }[index].firstMatch

      case .down:
        return query.allElementsBoundByIndex.filter { $0.label == "Decrement" }[index].firstMatch
      }
    }
  }

  /// Step up or down in a stepper at a given index.
  ///
  /// A stepper is not accessible by default. Making them accessible is also not a good solution
  /// as it would mean they would be exposed to the user as an accessible element (which it is not).
  ///
  /// Relying purely on the `buttons` query can lead to inconsistent behaviours between tests (e.g.: CI vs dev machines).
  ///
  /// The current solution aims at finding the buttons with an `accessibilityLabel` of "Increment" or "Decrement" and
  /// then find the right one using the index of the stepper.
  ///
  /// - parameters:
  ///     - stepButton: the increment or decrement button of a stepper
  ///     - index: the index of the stepper itself (not the individual buttons)
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func step(
    _ stepButton: StepButton,
    index: Int,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let element: XCUIElement = stepButton.elementFromQuery(query(for: .button), at: index)

    assertElementExists(element, timeout: timeout, file: file, line: line)

    element.tap()
  }
}
