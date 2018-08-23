//  Copyright © 2018 Outware Mobile. All rights reserved.

/// Permissions dialog types
public enum PermissionType {
  /// Calendar Permissions
  case calendar

  /// Camera permissions
  case camera

  /// Location permissions for when in use
  case locationServiceWhenInUse

  /// Location permissions for always and when in use
  case locationServiceAlwaysAndWhenInUse(LocationServiceButton)

  /// Photo library permissions
  case photoLibrary

  /// Reminders
  case reminders

  /// Location Service button for always and when in use alert.
  ///
  /// When requesting user's location with `CLLocation.requestAlwaysAuthorization()`, an alert with 3 buttons will be shown:
  /// 1. Allow always
  /// 2. Allow when in use
  /// 3. Do not allow
  ///
  /// This enum should be used in order to know which button to tap on.
  public enum LocationServiceButton {
    /// Always allow button
    case always

    /// When in use button
    case whenInUse

    fileprivate var allowIdentifier: String {
      switch self {
      case .always: return "Always Allow"
      case .whenInUse: return "Only While Using the App"
      }
    }
  }

  var allowIdentifier: String {
    switch self {
    case .calendar, .camera, .photoLibrary, .reminders: return "OK"
    case .locationServiceWhenInUse: return "Allow"
    case let .locationServiceAlwaysAndWhenInUse(button): return button.allowIdentifier
    }
  }

  var denyIdentifier: String {
    switch self {
    case .calendar, .camera, .locationServiceWhenInUse, .locationServiceAlwaysAndWhenInUse, .photoLibrary, .reminders: return "Don’t Allow"
    }
  }
}
