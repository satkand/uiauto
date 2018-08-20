//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class ToolbarsFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.swipe(to: .init(type: .cell, index: 16), in: .init(type: .table, identifier: "catalog_table"), direction: .up)
    application.tap(element: .init(type: .cell, index: 16))
  }

  func testToolbar() {
    application.tap(element: .init(type: .cell, index: 0))
    application.tap(element: .init(type: .button, identifier: "Action"))
  }
}
