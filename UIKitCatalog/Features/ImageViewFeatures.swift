//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class ImageViewFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.tap(element: .init(type: .cell, index: 4))
  }

  func testImageView() {
    application.verifyExistence(ofElement: .init(type: .image, identifier: "image_view_image_view"))
  }
}
