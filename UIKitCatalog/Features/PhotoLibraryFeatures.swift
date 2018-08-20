//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class PhotoLibraryFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    uninstallApplication(named: "UIKitCatalog")
    application = XCUIApplication()
    application.launch()
    application.swipe(to: .init(type: .cell, index: 20), in: .init(type: .table, identifier: "catalog_table"), direction: .up)
    application.tap(element: .init(type: .cell, index: 20))
  }

  override func tearDown() {
    // For some reason, if we don't terminate the app, some tests become flaky and fail randomly.
    application.terminate()
    application = nil
    super.tearDown()
  }

  func testDenyingPermission() {
    application.denyPermissionIfRequired(for: .photoLibrary)
  }

  func testAcceptingPermissionAndSelectingAPhoto() {
    application.selectPhoto()
  }

  func testCancellingSelectingAPhoto() {
    application.cancelSelectingPhoto()
  }

  func testAcceptingOrDenyingPermissionMultipleTimes() {
    application.acceptPermissionIfRequired(for: .photoLibrary)
    application.denyPermissionIfRequired(for: .photoLibrary)
    application.acceptPermissionIfRequired(for: .photoLibrary)
  }
}

final class PhotoLibraryEditableFeatures: XCTestCase {

  func testEditingTheSelectedPhoto() {
    uninstallApplication(named: "UIKitCatalog")

    let application: XCUIApplication = XCUIApplication()
    application.launch()

    application.swipe(to: .init(type: .cell, index: 21), in: .init(type: .table, identifier: "catalog_table"), direction: .up)
    application.tap(element: .init(type: .cell, index: 21))

    application.selectPhoto()
  }
}
