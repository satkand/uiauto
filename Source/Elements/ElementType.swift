//  Copyright © 2018 Apple. All rights reserved.

import XCTest

/// Custom element type that are handled by this framework
/// to abstract the interaction to this library from the XCUITest framework.
public enum ElementType {
  /// Button within an action sheet
  case actionSheetButton

  /// Activity indicator
  case activityIndicator

  /// Alert dialogs
  case alert

  /// Button within an alert
  case alertButton

  /// Button
  case button

  /// Cell
  case cell

  /// Date picker
  case datePicker

  /// Icon (currently used for accessing icons on the SpringBoard)
  case icon

  /// Image
  case image

  /// Label
  case label

  /// Menu item (e.g.: text field copy/paste)
  case menuItem

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

  /// Slider
  case slider

  /// Switch
  case `switch`

  /// Table
  case table

  /// Plain text field (for secure text field, see .secureTextField)
  case textField

  /// Text view
  case textView

  /// Link inside web views
  case webViewLink
}
