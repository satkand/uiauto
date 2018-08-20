//  Copyright © 2018 Outware Mobile. All rights reserved.

import XCTest

extension XCUIApplication {

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
    acceptPermissionIfRequired(for: .photos)

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
    acceptPermissionIfRequired(for: .photos)
    tap(element: .init(type: .button, identifier: "Cancel"), timeout: timeout, file: file, line: line)
  }
}
