//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class TextViewFeatures: Feature {
  override func afterLaunch() {
    let cell = Cell(index: 15)
    let table = Table(identifier: "catalog_table")

    app.swipe(to: cell, in: table, direction: .up)
    app.tap(element: cell)
  }

  func testTextView() {
    let textView = TextView(identifier: "text_view")

    let currentText: String = app.readText(from: textView)!

    app.type(text: "Sayonara.", into: textView)

    app.expect(element: textView, to: .haveText(currentText + "Sayonara."))

    app.swipe(element: textView, direction: .down)
    app.type(text: "Konichiwa. ", into: textView, position: .start)

    app.expect(element: textView, to: .haveText("Konichiwa. " + currentText + "Sayonara."))
  }
}
