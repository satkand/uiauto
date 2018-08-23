//  Copyright © 2018 Outware Mobile. All rights reserved.

import XCTest

extension XCUIApplication {
  /// Copy text from source element and paste into destination element
  ///
  /// - Parameters:
  ///   - sourceElement: the source element to copy the text from
  ///   - destinationElement: the destination element to paste the element into
  ///   - timeout: the specified amount of time to wait for the element to exist
  ///   - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called
  ///   - line: the line number on which failure occurred. Defaults to the line number on which this function was called
  public func copyText(from sourceElement: Element, andPasteInto destinationElement: Element, timeout: TimeInterval = 0, file: StaticString = #file, line: UInt = #line) {
    copyText(from: sourceElement, timeout: timeout, file: file, line: line)
    pasteText(into: destinationElement, timeout: timeout, file: file, line: line)
  }

  /// Copy text from source element
  ///
  /// - Parameters:
  ///   - sourceElement: the source element to copy the text from
  ///   - timeout: the specified amount of time to wait for the element to exist
  ///   - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called
  ///   - line: the line number on which failure occurred. Defaults to the line number on which this function was called
  public func copyText(from sourceElement: Element, timeout: TimeInterval = 0, file: StaticString = #file, line: UInt = #line) {
    doubleTap(element: sourceElement, timeout: timeout, file: file, line: line)

    tap(element: .init(type: .menuItem, identifier: "Select All"), timeout: timeout, file: file, line: line)
    tap(element: .init(type: .menuItem, identifier: "Copy"), timeout: timeout, file: file, line: line)
  }

  /// Paste text into destination element
  ///
  /// - Parameters:
  ///   - destinationElement: the destination element to paste the element into
  ///   - timeout: the specified amount of time to wait for the element to exist
  ///   - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called
  ///   - line: the line number on which failure occurred. Defaults to the line number on which this function was called
  public func pasteText(into destinationElement: Element, timeout: TimeInterval = 0, file: StaticString = #file, line: UInt = #line) {
    doubleTap(element: destinationElement, timeout: timeout, file: file, line: line)

    // Sleep process as it takes a while to display the "Paste" menu item
    sleep(1)

    tap(element: .init(type: .menuItem, identifier: "Paste"), timeout: timeout, file: file, line: line)
  }
}
