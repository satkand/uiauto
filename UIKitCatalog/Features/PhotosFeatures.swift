//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class PhotosFeatures: XCTestCase {

  private var application: XCUIApplication!

  // MARK: - Elements

  private var showPhotosOption: Element { return .init(type: .label, identifier: "Photos") }
  private var permissionDeniedErrorAlert: Element { return .init(type: .label, identifier: "WOOP!") }
  private var permissionDeniedAlertSettingsAction: Element { return .init(type: .alertButton, identifier: "Settings") }
  private var permissionDeniedAlertCancelAction: Element { return .init(type: .alertButton, identifier: "Cancel") }

  override func setUp() {
    super.setUp()

    uninstallApplication(named: "UIKitCatalog")
    application = XCUIApplication()
    application.launch()
    showOpenPhotosOption()
    openPhotos()
  }

  override func tearDown() {
    // For some reason, if we don't terminate the app, some tests become flaky and fail randomly.
    application.terminate()
    application = nil
    super.tearDown()
  }

  func testDenyingLibraryPermissionShowsErrorAlert() {
    application.denyPhotosPermission()

    application.expect(element: showPhotosOption, to: .exist(true))
    application.expect(element: permissionDeniedErrorAlert, to: .exist(true))
  }

  func testOpeningPhotosWhenAccessIsDeniedThenShowsErrorAlert() {
    application.denyPhotosPermission()
    application.expect(element: permissionDeniedErrorAlert, to: .exist(true))
    application.tap(element: permissionDeniedAlertCancelAction)

    openPhotos()

    application.expect(element: showPhotosOption, to: .exist(true))
    application.expect(element: permissionDeniedErrorAlert, to: .exist(true))
  }

  func testShowingApplicationSettingsViaAccessDeniedErrorAlert() {
    application.denyPhotosPermission()
    application.expect(element: permissionDeniedErrorAlert, to: .exist(true))

    application.tap(element: permissionDeniedAlertSettingsAction)

    application.verifyPhotosPermissionDeniedInSettings()
  }

  func testAllowingLibraryAccessShowsPhotos() {
    application.grantPhotosPermission()

    application.verifyIsShowingPhotos()
  }

  func testSelectingPhotoDismissesGallery() {
    application.grantPhotosPermission()

    application.selectPhoto()

    application.expect(element: showPhotosOption, to: .exist(true), timeout: 1)
  }

  func testShowingPhotosWhenPermissionIsGrantedThenProcceedsToPhotos() {
    application.grantPhotosPermission()
    application.cancelSelectingPhoto()

    openPhotos()

    application.verifyIsShowingPhotos()
  }

  func testSelectingPhotoWhenPermissionHasNotBeenAskedThenContinuesByGrantingAccess() {
    application.selectPhoto()

    application.expect(element: showPhotosOption, to: .exist(true), timeout: 1)
  }

  // MARK: - Helper Methods

  private func showOpenPhotosOption() {
    application.swipe(to: 20, in: "catalog_table", direction: .up)
  }

  private func openPhotos() {
    application.tap(element: .init(type: .cell, index: 20))
  }
}
