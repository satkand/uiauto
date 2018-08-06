//  Copyright © 2018 Apple. All rights reserved.

import XCTest
import Robocop

final class ImageViewFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.tap(.cell, atIndex: 4)
  }

  func testImageView() {
    application.verifyExistence(ofElement: .image, withIdentifier: "image_view_image_view")
  }
}
