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
    dateFormatter.dateFormat = "MMM d"

    application.pick(date: dateFormatter.string(from: Date()), hour: "11", minute: "30", timePeriod: .afterNoon, inDatePicker: "date_picker_date_picker")
  }
}
