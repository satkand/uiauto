//  Copyright © 2018 Outware Mobile. All rights reserved.

import XCTest

extension XCUIApplication {

  /// Accepts photo library permission if required and selects a photo from the library.
  ///
  /// - Parameters:
  ///   - timeout: the specified amount of time to wait for elements to exist
  ///   - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called
  ///   - line: the line number on which failure occurred. Defaults to the line number on which this function was called
  public func selectPhoto(timeout: TimeInterval = 2, file: StaticString = #file, line: UInt = #line) {
    acceptPermissionIfRequired(for: .photos, timeout: timeout, file: file, line: line)

    // There seems to be an Apple bug where using `.firstMatch` makes the process crash. Therefore, since we cannot use `first` and other Robocop actions
    // which make use `.firstMatch`, we have to query for the element ourselves.
    let albumName: String = "Camera Roll"
    let album: XCUIElement = query(for: .cell)[albumName]

    assert(album.waitForExistence(timeout: timeout), message: "No element \(ElementType.cell) with identifier '\(albumName)' found.", file: file, line: line)

    album.tap()

    let photoIndex: Int = 0
    let photo: XCUIElement = query(for: .cell).element(boundBy: photoIndex)

    assert(photo.waitForExistence(timeout: timeout), message: "No element \(ElementType.cell) at index '\(photoIndex)' found.", file: file, line: line)

    photo.tap()
  }

  /// Closes the photo gallery without selecting any photo.
  ///
  /// - Parameters:
  ///   - timeout: the specified amount of time to wait for elements to exist
  ///   - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called
  ///   - line: the line number on which failure occurred. Defaults to the line number on which this function was called
  public func cancelSelectingPhoto(timeout: TimeInterval = 2, file: StaticString = #file, line: UInt = #line) {
    acceptPermissionIfRequired(for: .photos, timeout: timeout, file: file, line: line)
    tap(element: .init(type: .button, identifier: "Cancel"), timeout: timeout, file: file, line: line)
  }
}
