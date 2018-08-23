//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class TextFieldsFeatures: Feature {
  private var defaultTextField: TextField!
  private var tintedTextField: TextField!

  override func afterLaunch() {
    let cell = Cell(index: 14)
    let table = Table(identifier: "catalog_table")

    app.swipe(to: cell, in: table, direction: .up)
    app.tap(element: cell)

    defaultTextField = TextField(identifier: "text_fields_default")
    tintedTextField = TextField(identifier: "text_fields_tinted")
  }

  func testTextFields() {
    app.type(text: "Hello", into: defaultTextField)
    app.type(text: "Foo Bar", into: tintedTextField)

    app.expect(element: defaultTextField, to: .haveText("Hello"))
    app.expect(element: tintedTextField, to: .haveText("Foo Bar"))

    let oldText: String = app.readText(from: defaultTextField) ?? ""

    app.clearText(in: defaultTextField)
    app.clearText(in: tintedTextField)

    app.type(text: oldText, into: defaultTextField)
    app.type(text: " World", into: defaultTextField)

    app.expect(element: defaultTextField, to: .haveText("Hello World"))
    app.expect(element: tintedTextField, to: .haveText(""))
  }

  func testCopyPaste() {
    app.type(text: "Hello", into: defaultTextField)

    app.copyText(from: defaultTextField, andPasteInto: tintedTextField, timeout: 0.5)

    app.expect(element: defaultTextField, to: .haveText("Hello"))
    app.expect(element: tintedTextField, to: .haveText("Hello"))
  }
}
