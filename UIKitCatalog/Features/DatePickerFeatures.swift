//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class DatePickerFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.tap(element: .init(type: .cell, index: 3))
  }

  func testDatePicker() {
    let dateFormatter: DateFormatter = .init()
    dateFormatter.dateFormat = "MMM-d h mm a"

    let futureDate: Date = Date().addingTimeInterval((60 * 60 * 13) + 60)
    let dateComponents: [String] = dateFormatter.string(from: futureDate).components(separatedBy: .whitespaces)

    application.pick(dateComponents[0].replacingOccurrences(of: "-", with: " "), in: .init(type: .pickerWheel, index: 0))
    application.pick(dateComponents[1], in: .init(type: .pickerWheel, index: 1))
    application.pick(dateComponents[2], in: .init(type: .pickerWheel, index: 2))
    application.pick(dateComponents[3], in: .init(type: .pickerWheel, index: 3))
  }
}
