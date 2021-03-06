//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {
  /// Navigate back once by tapping the back button.
  ///
  /// To be generic, it is assumed that the first button is always the back button.
  /// Otherwise it would be impossible to have a generic method to be used.
  ///
  /// Should a back button be set in a different way, you will have to create your own version of this function.
  ///
  /// - parameters:
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func navigateBack(timeout: TimeInterval = 0, file: StaticString = #file, line: UInt = #line) {
    first(element: .init(type: .navigationBarButton, index: 0), timeout: timeout, file: file, line: line).tap()
  }
}
