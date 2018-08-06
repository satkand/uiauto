//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Type `text` into element with given identifier and type.
  /// 
  /// - parameters:
  ///     - text: the text to input into the text entry form
  ///     - identifier: the identifier of the element
  ///     - type: the text entry type
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func typeText(
    _ text: String,
    intoElement identifier: String,
    ofType type: TextEntryType = .textField,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let textEntryElement: XCUIElement = first(.textEntry(type), withIdentifier: identifier, file: file, line: line)

    textEntryElement.tap()
    textEntryElement.typeText(text)
  }

  /// Clear text in text entry type with given identifier.
  ///
  /// - parameters:
  ///     - textEntry: the text entry type
  ///     - identifier: the identifier of the text entry
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func clearText(inTextEntry textEntry: TextEntryType, withIdentifier identifier: String, file: StaticString = #file, line: UInt = #line) {
    let element: XCUIElement = first(.textEntry(textEntry), withIdentifier: identifier, file: file, line: line)

    let text: String = element.value as? String ?? ""
    let deleteString: String = String(repeating: XCUIKeyboardKey.delete.rawValue, count: text.count)

    element.tap()
    element.typeText(deleteString)
  }
}
