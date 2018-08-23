//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class ImageViewFeatures: Feature {
  override func afterLaunch() {
    let cell = Cell(index: 4)
    app.tap(element: cell)
  }

  func testImageView() {
    let image = Image(identifier: "image_view_image_view")
    app.expect(element: image, to: .exist(true))
  }
}
