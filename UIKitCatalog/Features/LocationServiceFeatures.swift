//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class LocationServiceFeatures: Feature {
  override func beforeLaunch() {
    settingsApp.launch()

    settingsApp.tap(element: Cell(identifier: "General"))
    settingsApp.tap(element: Cell(identifier: "Reset"))
    settingsApp.tap(element: Cell(identifier: "Reset Location & Privacy"))
    settingsApp.tap(element: ActionSheetButton(identifier: "Reset Warnings"))
    settingsApp.terminate()
  }

  override func afterLaunch() {
    let cell = Cell(index: 25)
    let table = Table(identifier: "catalog_table")
    app.swipe(to: cell, in: table, direction: .up)
  }

  func testAcceptingPermissionForLocationAlways() {
    app.tap(element: Cell(index: 24))
    app.acceptPermissionIfRequired(for: .locationServiceAlwaysAndWhenInUse(.always))
  }

  func testAcceptingPermissionForLocationWhenInUseWhenRequestingAlways() {
    app.tap(element: Cell(index: 24))
    app.acceptPermissionIfRequired(for: .locationServiceAlwaysAndWhenInUse(.whenInUse))
  }

  func testAcceptingPermissionForLocationWhenInUse() {
    app.tap(element: Cell(index: 25))
    app.acceptPermissionIfRequired(for: .locationServiceWhenInUse)
  }

  func testDenyingPermissionForLocationAlways() {
    app.tap(element: Cell(index: 24))
    app.denyPermissionIfRequired(for: .locationServiceAlwaysAndWhenInUse(.always))
  }

  func testDenyingPermissionForLocationWhenInUseWhenRequestingAlways() {
    app.tap(element: Cell(index: 24))
    app.denyPermissionIfRequired(for: .locationServiceAlwaysAndWhenInUse(.whenInUse))
  }

  func testDenyingPermissionForLocationWhenInUse() {
    app.tap(element: Cell(index: 25))
    app.denyPermissionIfRequired(for: .locationServiceWhenInUse)
  }
}
