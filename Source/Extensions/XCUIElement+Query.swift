//  Copyright © 2018 Apple. All rights reserved.

import XCTest

extension XCUIElement {

  /// Build a `XCUIElementQuery` given an `ElementType`.
  ///
  /// - parameters:
  ///     - elementType: the type of elements to build the query
  ///
  /// - returns: A query containing elements that matches the given type
  public func query(for elementType: Robocop.ElementType) -> XCUIElementQuery {
    switch elementType {
    case .actionSheetButton: return sheets.buttons
    case .activityIndicator: return activityIndicators
    case .alertButton: return alerts.buttons
    case .button: return buttons
    case .cell: return cells
    case .datePicker: return datePickers
    case .image: return images
    case .navigationBarButton: return navigationBars.buttons
    case .navigationBarTitle: return navigationBars
    case .pageControl: return pageIndicators
    case .picker: return pickers
    case .pickerWheel: return pickerWheels
    case .progressView: return progressIndicators
    case .searchBar: return otherElements
    case .searchField: return searchFields
    case .secureTextField: return secureTextFields
    case .switch: return switches
    case .table: return tables
    case .textField: return textFields
    case .textView: return textViews
    }
  }
}
