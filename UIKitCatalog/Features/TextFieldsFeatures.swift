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

    application.verifyText("Hello", inElement: .init(type: .textEntry(.textField), identifier: "text_fields_default"))
    application.verifyText("Foo Bar", inElement: .init(type: .textEntry(.textField), identifier: "text_fields_tinted"))

    let oldText: String = application.readText(from: .init(type: .textEntry(.textField), identifier: "text_fields_default")) ?? ""

    application.clearText(inTextEntry: .textField, withIdentifier: "text_fields_default")
    application.clearText(inTextEntry: .textField, withIdentifier: "text_fields_tinted")

    application.type(text: oldText, intoElement: "text_fields_default")
    application.type(text: " World", intoElement: "text_fields_default")

    application.verifyText("Hello World", inElement: .init(type: .textEntry(.textField), identifier: "text_fields_default"))
    application.verifyText("", inElement: .init(type: .textEntry(.textField), identifier: "text_fields_tinted"))
  }
}
