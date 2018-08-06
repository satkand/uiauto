//  Copyright © 2018 Apple. All rights reserved.

import XCTest
import Robocop

final class TextFieldsFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.swipe(to: 14, in: "catalog_table", direction: .up)
    application.tap(.cell, atIndex: 14)
  }

  func testTextFields() {
    application.typeText("Hello", intoElement: "text_fields_default")
    application.typeText("Foo Bar", intoElement: "text_fields_tinted")

    application.verifyValue(expectedValue: "Hello", inElement: .textEntry(.textField), withIdentifier: "text_fields_default")
    application.verifyValue(expectedValue: "Foo Bar", inElement: .textEntry(.textField), withIdentifier: "text_fields_tinted")

    let oldText: String = application.readText(from: .textEntry(.textField), withIdentifier: "text_fields_default") ?? ""

    application.clearText(inTextEntry: .textField, withIdentifier: "text_fields_default")
    application.clearText(inTextEntry: .textField, withIdentifier: "text_fields_tinted")

    application.typeText(oldText, intoElement: "text_fields_default")
    application.typeText(" World", intoElement: "text_fields_default")

    application.verifyValue(expectedValue: "Hello World", inElement: .textEntry(.textField), withIdentifier: "text_fields_default")
    application.verifyValue(expectedValue: "", inElement: .textEntry(.textField), withIdentifier: "text_fields_tinted")
  }
}
