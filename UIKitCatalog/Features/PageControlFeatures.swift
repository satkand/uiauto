//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class PageControlFeatures: Feature {
  private let pageControlIdentifier: String = "page_control"
  private var pageControl: PageControl!

  override func afterLaunch() {
    app.tap(element: Cell(index: 5))
    pageControl = PageControl(identifier: pageControlIdentifier)
  }

  func testPageControlTaps() {
    app.expect(element: pageControl, to: .haveText("page 3 of 10"))

    app.tap(element: pageControl, in: .left)
    app.expect(element: pageControl, to: .haveText("page 2 of 10"))

    app.tap(element: pageControl, in: .right)
    app.expect(element: pageControl, to: .haveText("page 3 of 10"))
  }

  func testPageControlSwipes() {
    app.expect(element: pageControl, to: .haveText("page 3 of 10"))

    app.swipe(element: pageControl, direction: .left)
    app.expect(element: pageControl, to: .haveText("page 2 of 10"))

    app.swipe(element: pageControl, direction: .right)
    app.expect(element: pageControl, to: .haveText("page 3 of 10"))
  }
}
