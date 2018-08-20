//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class CalendarEventFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.swipe(to: 21, in: "catalog_table", direction: .up)
    application.tap(element: .init(type: .cell, index: 21))
  }

  override func tearDown() {
    application.terminate()

    super.tearDown()
  }

  func testAddingCalendarReminder() {
    application.addCalendarEvent()

    application.tap(element: .init(type: .alertButton, identifier: "OK"))
  }
}
