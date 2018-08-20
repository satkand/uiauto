//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class ReminderFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()
    uninstallApplication(named: "UIKitCatalog")
    application = XCUIApplication()
    application.launch()
    application.swipe(to: 23, in: "catalog_table", direction: .up)
    application.tap(element: .init(type: .cell, index: 23))
  }

  override func tearDown() {
    application.terminate()
    application = nil
    super.tearDown()
  }

  func testAcceptingPermissionAndAddingAReminder() {
    application.acceptPermissionIfRequired(for: .reminders)

    application.expect(element: .init(type: .alert, identifier: "Reminder Added"), to: .exist(true))
  }

  func testDenyingPermissionForReminders() {
    application.denyPermissionIfRequired(for: .reminders)

    application.expect(element: .init(type: .alert, identifier: "Reminder Added"), to: .exist(false))
  }
}
