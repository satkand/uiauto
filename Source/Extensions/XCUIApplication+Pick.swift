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
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func pick(
    _ wheelValue: String,
    fromColumn column: Int,
    inPicker identifier: String,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let element: XCUIElement = first(element: .init(type: .picker, identifier: identifier), timeout: timeout, file: file, line: line)
      .first(element: .init(type: .pickerWheel, index: column), timeout: timeout, file: file, line: line)

    guard element.exists else { return }

    element.adjust(toPickerWheelValue: wheelValue)
  }

  /// Select date and time in date picker
  ///
  /// - parameters:
  ///     - date: the date are expected to be in this format "MMM d"
  ///     - hour: the hour of the day
  ///     - time: the time of the day
  ///     - timePeriod: the meridiem period (AM/PM)
  ///     - datePickerIdentifier: the identifier of the date picker
  ///     - timeout: the specified amount of time to wait for the element to exist
  ///     - file: the file in which failure occurred. Defaults to the file name of the test case in which this function was called.
  ///     - line: the line number on which failure occurred. Defaults to the line number on which this function was called.
  public func pick(
    date: String,
    hour: String,
    minute: String,
    timePeriod: TimePeriod,
    inDatePicker datePickerIdentifier: String,
    timeout: TimeInterval = 0,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let element: Element = .init(type: .datePicker, identifier: datePickerIdentifier)
    let datePicker: XCUIElement = first(element: element, timeout: timeout, file: file, line: line)
    let pickerWheelsCount: Int = datePicker.pickerWheels.count

    guard datePicker.exists else { return }

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
