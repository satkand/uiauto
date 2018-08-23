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

      application.swipe(to: cell, in: table, direction: .up)
      application.tap(element: cell)
    }

    func testAcceptingPermissionAndTakingAPhoto() {
      application.takePhoto()
    }

    func testDenyingPermission() {
      application.denyPermissionIfRequired(for: .camera)
    }

    func testAcceptingOrDenyPermissionMultipleTimes() {
      application.acceptPermissionIfRequired(for: .camera)
      application.acceptPermissionIfRequired(for: .camera)
      application.denyPermissionIfRequired(for: .camera)
    }

    func testCancellingTakingAPhoto() {
      application.cancelTakingPhoto()
    }
  }

  final class CameraEditableFeatures: Feature {

    override func beforeLaunch() {
      uninstallApplication(named: "UIKitCatalog")
    }

    override func afterLaunch() {
      let cell = Cell(index: 19)
      let table = Table(identifier: "catalog_table")

      application.swipe(to: cell, in: table, direction: .up)
      application.tap(element: cell)
    }

    func testEditingAPhoto() {
      application.takePhoto()
    }
  }

#endif
