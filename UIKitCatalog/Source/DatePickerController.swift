/*
 Copyright (C) 2017 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information

 Abstract:
 A view controller that demonstrates how to use UIDatePicker.
 */

import UIKit

class DatePickerController: UIViewController {
  // MARK: - Properties

  @IBOutlet var datePicker: UIDatePicker!

  @IBOutlet var dateLabel: UILabel!

  /// A date formatter to format the `date` property of `datePicker`.
  lazy var dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()

    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .short

    return dateFormatter
  }()

  // MARK: - View Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    configureDatePicker()
  }

  // MARK: - Configuration

  func configureDatePicker() {
    datePicker.datePickerMode = .dateAndTime
    datePicker.accessibilityIdentifier = "date_picker_date_picker"

    /** Set min/max date for the date picker. As an example we will limit the date between
     now and 7 days from now.
     */
    let now = Date()
    datePicker.minimumDate = now

    var dateComponents = DateComponents()
    dateComponents.day = 7

    let sevenDaysFromNow = Calendar.current.date(byAdding: .day, value: 7, to: now)
    datePicker.maximumDate = sevenDaysFromNow

    datePicker.minuteInterval = 1

    datePicker.addTarget(self, action: #selector(DatePickerController.updateDatePickerLabel), for: .valueChanged)

    updateDatePickerLabel()
  }

  // MARK: - Actions

  @objc
  func updateDatePickerLabel() {
    dateLabel.text = dateFormatter.string(from: datePicker.date)
  }
}
