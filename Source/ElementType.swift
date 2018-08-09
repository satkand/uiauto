//  Copyright © 2018 Apple. All rights reserved.

import XCTest

/// Custom element type that are handled by this framework
/// to abstract the interaction to this library from the XCUITest framework.
public enum ElementType {

  /// Button within an action sheet
  case actionSheetButton

  /// Activity indicator
  case activityIndicator

  /// Button within an alert
  case alertButton

  /// Button
  case button

  /// Cell
  case cell

  /// Date picker
  case datePicker

  /// Image
  case image

  /// Navigation bar button
  case navigationBarButton

  /// Title within a navigation bar
  ///
  /// This will assume that a new `navigationItem` is set on the view controller
  /// as a navigation bar by default is not accessible
  case navigationBarTitle

  /// Page control
  case pageControl

  /// Picker
  case picker

  /// Wheel from picker
  case pickerWheel

  /// Progress view
  case progressView

  /// Search bar
  case searchBar

  /// Search field, usually contained within a searchBar
  case searchField

  /// Secure text field (for other text fields, see .textField)
  case secureTextField

  /// Switch
  case `switch`

  /// Table
  case table

  /// Plain text field (for secure text field, see .secureTextField)
  case textField

  /// Text view
  case textView
}
