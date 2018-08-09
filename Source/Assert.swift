//  Copyright © 2018 Apple. All rights reserved.

import XCTest

func assert(_ condition: Bool, message: String, file: StaticString, line: UInt) {
  if !condition { XCTFail(message, file: file, line: line) }
}

func assertElementExists(_ element: XCUIElement, file: StaticString, line: UInt) {
  assert(element.exists, message: "Expected element '\(element)' to exists.", file: file, line: line)
}
