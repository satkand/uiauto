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

    application.tap(element: .init(type: .alertButton, identifier: "OK"), timeout: 2)
  }

  func testAddingAndCustomisingCalendarEvent() {

    let eventDetails: [XCUIApplication.EventDetail] = [
      .title("Farewell Party"),
      .url("https://www.google.com.au"),
      .notes("We're gathered here today..."),
    ]

    application.addCalendarEvent(withDetails: eventDetails)

    application.tap(element: .init(type: .alertButton, identifier: "OK"), timeout: 2)
  }
}
