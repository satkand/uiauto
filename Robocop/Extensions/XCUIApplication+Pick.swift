//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIApplication {

  /// The two 12-hour time periods
  public enum TimePeriod {

    // Ante meridiem period, aka. before noon
    case beforeNoon

    // Post meridiem period, aka. after noon
    case afterNoon

    fileprivate var abbreviation: String {
      switch self {
      case .beforeNoon: return "AM"
      case .afterNoon: return "PM"
      }
    }
  }

  /// Select wheel value in picker from given column
  ///
  /// - parameters:
  ///     - wheelValue: the value to be set on the wheel
  ///     - column: the wheel column
  ///     - identifier: the identifier of the picker element
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func pick(
    _ wheelValue: String,
    fromColumn column: Int,
    inPicker identifier: String? = nil,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let element: XCUIElement = identifier
      .flatMap { [unowned self] in self.first(.picker, withIdentifier: $0, file: file, line: line).pickerWheels.element(boundBy: column) }
      ?? first(.pickerWheel, atIndex: column, file: file, line: line)

    element.adjust(toPickerWheelValue: wheelValue)
  }

  /// Select date and time in date picker
  ///
  /// - parameters:
  ///     - date: the date are expected to be in this format "MMM d"
  ///     - hour: the hour of the day
  ///     - time: the time of the day
  ///     - timePeriod: the meridiem period (AM/PM)
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func pick(
    date: String,
    hour: String,
    minute: String,
    timePeriod: TimePeriod,
    inElement elementIdentifier: String,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let datePicker: XCUIElement = first(.datePicker, withIdentifier: elementIdentifier, file: file, line: line)
    let pickerWheelsCount: Int = datePicker.pickerWheels.count

    assert(
      pickerWheelsCount == 4,
      message: "Expected `DatePicker` to have 4 picker wheels, found \(pickerWheelsCount)",
      file: file,
      line: line
    )

    datePicker.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: date)
    datePicker.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: hour)
    datePicker.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: minute)
    datePicker.pickerWheels.element(boundBy: 3).adjust(toPickerWheelValue: timePeriod.abbreviation)
  }
}
