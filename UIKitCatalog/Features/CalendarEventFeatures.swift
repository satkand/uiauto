//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class CalendarEventFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    uninstallApplication(named: "UIKitCatalog")

    application = XCUIApplication()
    application.launch()

    application.swipe(to: .init(type: .cell, index: 22), in: .init(type: .table, identifier: "catalog_table"), direction: .up)
    application.tap(element: .init(type: .cell, index: 22))
  }

  override func tearDown() {
    application.terminate()

    super.tearDown()
  }

  func testAddingCalendarEvent() {
    application.addCalendarEvent()
  }

  func testCancellingAddingCalendarEvent() {
    application.cancelAddingEvent()
  }
}
