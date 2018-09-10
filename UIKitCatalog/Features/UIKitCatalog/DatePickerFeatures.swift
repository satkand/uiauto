//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class DatePickerFeatures: Feature {
  override func afterLaunch() {
    let cell = Cell(index: 3)
    app.tap(element: cell)
  }

  func testDatePicker() {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM-d h mm a"

    let futureDate: Date = Date().addingTimeInterval((60 * 60 * 13) + 60)
    let dateComponents: [String] = dateFormatter.string(from: futureDate).components(separatedBy: .whitespaces)

    let dateWheel = PickerWheel(index: 0)
    let hourWheel = PickerWheel(index: 1)
    let minuteWheel = PickerWheel(index: 2)
    let dayPeriod = PickerWheel(index: 3)

    app.pick(dateComponents[0].replacingOccurrences(of: "-", with: " "), in: dateWheel)
    app.pick(dateComponents[1], in: hourWheel)
    app.pick(dateComponents[2], in: minuteWheel)
    app.pick(dateComponents[3], in: dayPeriod)
  }
}
