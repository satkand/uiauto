//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Position in which to add the text
  public enum TextPosition {

    /// At the end of the text
    case end

    /// At the start of the text
    case start

    fileprivate var tapArea: Area {
      switch self {
      case .end: return .bottomRight
      case .start: return .topLeft
      }
    }
  }

  /// Type `text` into element with given identifier and type.
  ///
  /// - parameters:
  ///     - text: the text to input into the text entry form
  ///     - element: the struct containing details of the `XCUIElement` to find
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func type(
    text: String,
    into element: Element,
    position: TextPosition = .end,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let uiElement: XCUIElement = first(element: element, timeout: timeout, file: file, line: line)

    guard uiElement.exists else { return }

    tap(element: element, in: position.tapArea)

    uiElement.typeText(text)
  }

  /// Clear text in text entry type with given identifier.
  ///
  /// - parameters:
  ///     - element: the struct containing details of the `XCUIElement` to find
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func clearText(in element: Element, timeout: TimeInterval = 0, file: StaticString = #file, line: UInt = #line) {
    let element: XCUIElement = first(element: element, timeout: timeout, file: file, line: line)

    guard element.exists else { return }

    let text: String = element.value as? String ?? ""
    let deleteString: String = String(repeating: XCUIKeyboardKey.delete.rawValue, count: text.count)

    element.tap()
    element.typeText(deleteString)
  }
}
