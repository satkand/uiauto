//  Copyright © 2018 Outware Mobile. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Accept camera permission if required and take a photo on the Camera screen
  ///
  /// - Parameters:
  ///   - timeout: the specified amount of time to wait for the element to exist
  ///   - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called
  ///   - line: the line number on which failure occurred. Defaults to the line number on which this function was called
  public func takePhoto(timeout: TimeInterval = 0, file: StaticString = #file, line: UInt = #line) {
    acceptPermissionIfRequired(for: .camera)

    // The camera app needs to be able to set the focus, otherwise it won't be able to take a photo (i.e.: please don't shake the device like crayz)
    tap(element: .init(type: .button, identifier: "PhotoCapture"), timeout: 5, file: file, line: line)

    let usePhotoElement: Element = .init(type: .button, identifier: "Use Photo")
    let usePhotoUIElement: XCUIElement = first(element: usePhotoElement, failable: false, timeout: 5, file: file, line: line)

    guard usePhotoUIElement.exists else { return }

    tap(element: usePhotoElement, timeout: timeout, file: file, line: line)
  }

  /// Accept camera permission if required and cancel taking a photo on the Camera screen
  ///
  /// - Parameters:
  ///   - timeout: the specified amount of time to wait for the element to exist
  ///   - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called
  ///   - line: the line number on which failure occurred. Defaults to the line number on which this function was called
  public func cancelTakingPhoto(timeout: TimeInterval = 0, file: StaticString = #file, line: UInt = #line) {
    acceptPermissionIfRequired(for: .camera)
    tap(element: .init(type: .button, identifier: "Cancel"), timeout: timeout, file: file, line: line)
  }
}
