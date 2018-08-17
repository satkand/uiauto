//  Copyright © 2018 Outware Mobile. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Take a photo on the Camera screen
  public func takePhoto(timeout: TimeInterval = 0, file: StaticString = #file, line: UInt = #line) {
    tap(element: .init(type: .button, identifier: "PhotoCapture"), timeout: timeout, file: file, line: line)
  }

  /// Accept camera permission if required and take a photo on the Camera screen
  public func takePhotoAndAcceptPermissionIfRequired(timeout: TimeInterval = 0, file: StaticString = #file, line: UInt = #line) {
    acceptPermissionIfRequired(ofType: .camera)
    takePhoto(timeout: timeout, file: file, line: line)
  }
}
