//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class CalendarEventFeatures: Feature {
  override func beforeLaunch() {
    uninstallApplication(named: "UIKitCatalog")
  }

  override func afterLaunch() {
    let cell = Cell(index: 22)
    let table = Table(identifier: "catalog_table")

    app.swipe(to: cell, in: table, direction: .up)
    app.tap(element: cell)
  }

  func testAddingCalendarEvent() {
    app.addCalendarEvent()
  }

  func testCancellingAddingCalendarEvent() {
    app.cancelAddingCalendarEvent()
  }
}
