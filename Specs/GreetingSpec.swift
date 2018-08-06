//  Copyright © 2017 Outware Mobile. All rights reserved.

@testable import Robocop
import XCTest

final class GreetingSpec: XCTestCase {

  func testHelloWorldGreeting() {
    XCTAssertEqual(Greeting.hello, "Hello, world!")
  }
}
