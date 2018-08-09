//  Copyright © 2018 Apple. All rights reserved.

import XCTest

/// Custom element type that are handled by this framework
/// to abstract the interaction to this library from the XCUITest framework.
public enum ElementType {

  /// Button within an action sheet
  case actionSheetButton

  /// Any activity indicator
  case activityIndicator

  /// Button within an alert
  case alertButton

  /// Any button
  case button

  /// Any cell
  case cell

  /// Any date picker
  case datePicker

  /// Any image
  case image

  /// Any navigation bar button
  case navigationBarButton

  /// Title within a navigation bar
  ///
  /// This will assume that a new `navigationItem` is set on the view controller
  /// as a navigation bar by default is not accessible
  case navigationBarTitle

  /// Any page control
  case pageControl

  /// Any picker
  case picker

  /// Any wheel from any picker
  case pickerWheel

  /// Any progress view
  case progressView

  /// Search bar element
  case searchBar

  /// Any secure text field
  case secureTextField

  /// Any switch
  case `switch`

  /// Any table
  case table

  /// Any plain text field
  case textField

  /// Any text view
  case textView
}
