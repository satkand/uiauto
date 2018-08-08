//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class TextFieldsFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.swipe(to: 14, in: "catalog_table", direction: .up)
    application.tap(element: .init(type: .cell, index: 14))
  }

  func testTextFields() {
    application.type(text: "Hello", intoElement: "text_fields_default")
    application.type(text: "Foo Bar", intoElement: "text_fields_tinted")

    application.expect(element: .init(type: .textEntry(.textField), identifier: "text_fields_default"), to: .haveText("Hello"))
    application.expect(element: .init(type: .textEntry(.textField), identifier: "text_fields_tinted"), to: .haveText("Foo Bar"))

    let oldText: String = application.readText(from: .init(type: .textEntry(.textField), identifier: "text_fields_default")) ?? ""

    application.clearText(inTextEntry: .textField, withIdentifier: "text_fields_default")
    application.clearText(inTextEntry: .textField, withIdentifier: "text_fields_tinted")

    application.type(text: oldText, intoElement: "text_fields_default")
    application.type(text: " World", intoElement: "text_fields_default")

    application.expect(element: .init(type: .textEntry(.textField), identifier: "text_fields_default"), to: .haveText("Hello World"))
    application.expect(element: .init(type: .textEntry(.textField), identifier: "text_fields_tinted"), to: .haveText(""))
  }
}
