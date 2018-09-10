//  Copyright © 2018 Apple. All rights reserved.

import Robocop

#if !(targetEnvironment(simulator))

  final class CameraFeatures: Feature {
    override func beforeLaunch() {
      uninstallApplication(named: "UIKitCatalog")
    }

    override func afterLaunch() {
      let cell = Cell(index: 18)
      let table = Table(identifier: "catalog_table")

      app.swipe(to: cell, in: table, direction: .up)
      app.tap(element: cell)
    }

    func testAcceptingPermissionAndTakingAPhoto() {
      app.takePhoto()
    }

    func testDenyingPermission() {
      app.denyPermissionIfRequired(for: .camera)
    }

    func testAcceptingOrDenyPermissionMultipleTimes() {
      app.acceptPermissionIfRequired(for: .camera)
      app.acceptPermissionIfRequired(for: .camera)
      app.denyPermissionIfRequired(for: .camera)
    }

    func testCancellingTakingAPhoto() {
      app.cancelTakingPhoto()
    }
  }

  final class CameraEditableFeatures: Feature {
    override func beforeLaunch() {
      uninstallApplication(named: "UIKitCatalog")
    }

    override func afterLaunch() {
      let cell = Cell(index: 19)
      let table = Table(identifier: "catalog_table")

      app.swipe(to: cell, in: table, direction: .up)
      app.tap(element: cell)
    }

    func testEditingAPhoto() {
      app.takePhoto()
    }
  }

#endif
