//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

/// This
final class LocationServiceFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    let settingsApplication: XCUIApplication = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
    settingsApplication.launch()
    settingsApplication.tap(element: .init(type: .cell, identifier: "General"))
    settingsApplication.tap(element: .init(type: .cell, identifier: "Reset"))
    settingsApplication.tap(element: .init(type: .cell, identifier: "Reset Location & Privacy"))
    settingsApplication.tap(element: .init(type: .actionSheetButton, identifier: "Reset Warnings"))
    settingsApplication.terminate()

    application = XCUIApplication()
    application.launch()
    application.swipe(to: .init(type: .cell, index: 25), in: .init(type: .table, identifier: "catalog_table"), direction: .up)
  }

  override func tearDown() {
    application.terminate()
    application = nil
    super.tearDown()
  }

  func testAcceptingPermissionForLocationAlways() {
    application.tap(element: .init(type: .cell, index: 24))
    application.acceptPermissionIfRequired(for: .locationServiceAlwaysAndWhenInUse(.always))
  }

  func testAcceptingPermissionForLocationWhenInUseWhenRequestingAlways() {
    application.tap(element: .init(type: .cell, index: 24))
    application.acceptPermissionIfRequired(for: .locationServiceAlwaysAndWhenInUse(.whenInUse))
  }

  func testAcceptingPermissionForLocationWhenInUse() {
    application.tap(element: .init(type: .cell, index: 25))
    application.denyPermissionIfRequired(for: .locationServiceWhenInUse)
  }

  func testDenyingPermissionForLocationAlways() {
    application.tap(element: .init(type: .cell, index: 24))
    application.denyPermissionIfRequired(for: .locationServiceAlwaysAndWhenInUse(.always))
  }

  func testDenyingPermissionForLocationWhenInUseWhenRequestingAlways() {
    application.tap(element: .init(type: .cell, index: 24))
    application.denyPermissionIfRequired(for: .locationServiceAlwaysAndWhenInUse(.whenInUse))
  }

  func testDenyingPermissionForLocationWhenInUse() {
    application.tap(element: .init(type: .cell, index: 25))
    application.denyPermissionIfRequired(for: .locationServiceWhenInUse)
  }
}
