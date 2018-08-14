//  Copyright © 2018 Apple. All rights reserved.

import XCTest

func assert(_ condition: Bool, message: String, file: StaticString, line: UInt) {
  XCTAssert(condition, message, file: file, line: line)
}

func assertElementExists(_ element: XCUIElement, timeout: TimeInterval = 0, file: StaticString, line: UInt) {
  assert(
    element.waitForExistence(timeout: timeout),
    message: "Expected element '\(element)' to exists.",
    file: file,
    line: line
  )
}
