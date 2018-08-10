//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class TextViewFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.swipe(to: 15, in: "catalog_table", direction: .up)
    application.tap(element: .init(type: .cell, index: 15))
  }

  func testTextView() {

    let textView: Element = .init(type: .textView, identifier: "text_view")

    let currentText: String = application.readText(from: textView)!

    application.type(text: "Sayonara.", into: .init(type: .textView))

    application.expect(element: textView, to: .haveText(currentText + "Sayonara."))

    application.swipe(element: textView, direction: .down)
    application.type(text: "Konichiwa. ", into: .init(type: .textView), position: .start)

    application.expect(element: textView, to: .haveText("Konichiwa. " + currentText + "Sayonara."))
  }
}
