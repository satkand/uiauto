//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class PhotoLibraryFeatures: Feature {
  override func beforeLaunch() {
    uninstallApplication(named: "UIKitCatalog")
  }

  override func afterLaunch() {
    let cell = Cell(index: 20)
    let table = Table(identifier: "catalog_table")

    app.swipe(to: cell, in: table, direction: .up)
    app.tap(element: cell)
  }

  func testDenyingPermission() {
    app.denyPermissionIfRequired(for: .photoLibrary)
  }

  func testAcceptingPermissionAndSelectingAPhoto() {
    app.selectPhoto()
  }

  func testCancellingSelectingAPhoto() {
    app.cancelSelectingPhoto()
  }

  func testAcceptingOrDenyingPermissionMultipleTimes() {
    app.acceptPermissionIfRequired(for: .photoLibrary)
    app.denyPermissionIfRequired(for: .photoLibrary)
    app.acceptPermissionIfRequired(for: .photoLibrary)
  }
}

final class PhotoLibraryEditableFeatures: Feature {
  override func beforeLaunch() {
    uninstallApplication(named: "UIKitCatalog")
  }

  func testEditingTheSelectedPhoto() {
    let cell = Cell(index: 21)
    let table = Table(identifier: "catalog_table")

    app.swipe(to: cell, in: table, direction: .up)
    app.tap(element: .init(type: .cell, index: 21))

    app.selectPhoto()
  }
}
