//  Copyright © 2018 Apple. All rights reserved.

import XCTest

func assert(_ assertion: Bool, message: String, file: StaticString, line: UInt) {
  if !assertion { XCTFail(message, file: file, line: line) }
}
