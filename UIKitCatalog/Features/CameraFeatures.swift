//  Copyright © 2018 Apple. All rights reserved.

import XCTest

#if !(targetEnvironment(simulator))

  final class CameraFeatures: XCTestCase {

    private var application: XCUIApplication!

    override func setUp() {
      super.setUp()

      uninstallApplication(named: "UIKitCatalog")

      application = XCUIApplication()
      application.launch()

      application.swipe(to: .init(type: .cell, index: 18), in: .init(type: .table, identifier: "catalog_table"), direction: .up)
      application.tap(element: .init(type: .cell, index: 18))
    }

    override func tearDown() {
      application.terminate()
      application = nil

      super.tearDown()
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

  final class CameraEditableFeatures: XCTestCase {

    func testEditingAPhoto() {
      uninstallApplication(named: "UIKitCatalog")

      let application: XCUIApplication = XCUIApplication()
      application.launch()

      application.swipe(to: .init(type: .cell, index: 19), in: .init(type: .table, identifier: "catalog_table"), direction: .up)
      application.tap(element: .init(type: .cell, index: 19))

      application.takePhoto()
    }
  }

#endif
