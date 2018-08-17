//  Copyright © 2018 Outware Mobile. All rights reserved.

import XCTest

extension XCUIApplication {

  // MARK: - Permission Handlers

  /// Grants permission to access photos by accepting the request. You can onluy call this function immediatelly after showing
  /// the system alert.
  ///
  /// - Parameters:
  ///   - timeout: the specified amount of time to wait for elements to exist
  ///   - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called
  ///   - line: the line number on which failure occurred. Defaults to the line number on which this function was called
  public func grantPhotosPermission(timeout: TimeInterval = 1, file: StaticString = #file, line: UInt = #line) {
    let springboardApplication: XCUIApplication = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    springboardApplication.tap(element: .init(type: .alertButton, identifier: "OK"), timeout: timeout, file: file, line: line)
  }

  /// Chooses to not allow access to photos. You can only call this function immediatelly after showing the system alert.
  ///
  /// - Parameters:
  ///   - timeout: the specified amount of time to wait for elements to exist
  ///   - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called
  ///   - line: the line number on which failure occurred. Defaults to the line number on which this function was called
  public func denyPhotosPermission(timeout: TimeInterval = 1, file: StaticString = #file, line: UInt = #line) {
    let springboardApplication: XCUIApplication = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    springboardApplication.tap(element: .init(type: .alertButton, identifier: "Don’t Allow"), timeout: timeout)
  }

  // MARK: - Verifiers

  /// Verifies that the photo gallery is being displayed.
  ///
  /// - Parameters:
  ///   - timeout: the specified amount of time to wait for elements to exist
  ///   - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called
  ///   - line: the line number on which failure occurred. Defaults to the line number on which this function was called
  public func verifyIsShowingPhotos(timeout: TimeInterval = 1, file: StaticString = #file, line: UInt = #line) {
    XCTAssertTrue(query(for: .cell)["Moments"].waitForExistence(timeout: timeout), "Did not show Photo Gallery.", file: file, line: line)
  }

  /// Verifies that access Photos is denied by checking the permission in application's settings.
  ///
  /// - Parameters:
  ///   - timeout: the specified amount of time to wait for elements to exist
  ///   - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called
  ///   - line: the line number on which failure occurred. Defaults to the line number on which this function was called
  public func verifyPhotosPermissionDeniedInSettings(timeout: TimeInterval = 1, file: StaticString = #file, line: UInt = #line) {
    let settingsApplication: XCUIApplication = .init(bundleIdentifier: "com.apple.Preferences")
    settingsApplication.expect(element: .init(type: .cell, identifier: "Photos"), to: .haveText("Never"), timeout: timeout, file: file, line: line)
  }

  // MARK: - Actions

  /// Selects a photo from the library. By default, it will select the first photo in the "Camera Roll" album. If the permission has not been handled yet,
  /// it will grant the access and continue selecting the photo.
  ///
  /// - Parameters:
  ///   - album: the album containing the photo to be selected
  ///   - photoIndex: the index representing the photo to select
  ///   - timeout: the specified amount of time to wait for elements to exist
  ///   - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called
  ///   - line: the line number on which failure occurred. Defaults to the line number on which this function was called
  public func selectPhoto(fromAlbum album: String = "Camera Roll", atIndex photoIndex: Int = 0, timeout: TimeInterval = 2, file: StaticString = #file, line: UInt = #line) {

    let springboardApplication: XCUIApplication = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    if springboardApplication.first(element: .init(type: .alertButton, identifier: "OK"), failable: false, timeout: timeout).exists {
      grantPhotosPermission(file: file, line: line)
    }

    // There seems to be an Apple bug where using `.firstMatch` makes the process crash. Therefore, since we cannot use `first` and other Robocop actions
    // which make use `.firstMatch`, we have to query for the element ourselves.
    let album: XCUIElement = query(for: .cell)[album]

    let albumExists: Bool = album.waitForExistence(timeout: timeout)
    assert(albumExists, message: "No element \(ElementType.cell) with identifier '\(album)' found.", file: file, line: line)

    album.tap()

    let photo: XCUIElement = query(for: .cell).element(boundBy: photoIndex)
    let photoExists: Bool = photo.waitForExistence(timeout: timeout)

    assert(photoExists, message: "No element \(ElementType.cell) at index '\(photoIndex)' found.", file: file, line: line)

    photo.tap()
  }

  /// Closes the photo gallery without selecting any photo.
  ///
  /// - Parameters:
  ///   - timeout: the specified amount of time to wait for elements to exist
  ///   - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called
  ///   - line: the line number on which failure occurred. Defaults to the line number on which this function was called
  public func cancelSelectingPhoto(timeout: TimeInterval = 2, file: StaticString = #file, line: UInt = #line) {
    tap(element: .init(type: .button, identifier: "Cancel"), timeout: timeout, file: file, line: line)
  }
}
