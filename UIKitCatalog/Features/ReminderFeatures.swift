//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class ReminderFeatures: Feature {
  private var alert: Alert!

  override func beforeLaunch() {
    uninstallApplication(named: "UIKitCatalog")
  }

  override func afterLaunch() {
    let cell = Cell(index: 23)
    let table = Table(identifier: "catalog_table")

    app.swipe(to: cell, in: table, direction: .up)
    app.tap(element: cell)

    alert = Alert(identifier: "Reminder Added")
  }

  func testAcceptingPermissionAndAddingAReminder() {
    app.acceptPermissionIfRequired(for: .reminders)
    app.expect(element: alert, to: .exist(true))
  }

  func testDenyingPermissionForReminders() {
    app.denyPermissionIfRequired(for: .reminders)
    app.expect(element: alert, to: .exist(false))
  }
}
