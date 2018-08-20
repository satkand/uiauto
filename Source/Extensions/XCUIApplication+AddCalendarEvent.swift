//  Copyright © 2018 Outware Mobile. All rights reserved.

import XCTest

extension XCUIApplication {

  public enum EventDetail {

    case title(String)
    case location(String)
    case allDay(Bool)
    case startDate(Date)
    case endDate(Date)
    case frequency(String)
    case travelTime(String)
    case alert(String)
    case secondAlert(String)
    case url(String)
    case notes(String)

    fileprivate var accessibilityIdentifier: String {

      switch self {
      case .title: return "Title"
      case .location: return "Location"
      case .allDay: return "All-day"
      case .startDate: return "Starts"
      case .endDate: return "Ends"
      case .frequency: return "Repeat"
      case .travelTime: return "Travel Time"
      case .alert: return "Alert"
      case .secondAlert: return "Second Alert"
      case .url: return "URL"
      case .notes: return "Notes"
      }
    }
  }

  public func addCalendarEvent(withDetails eventDetails: [EventDetail] = [], timeout: TimeInterval = 0, file: StaticString = #file, line: UInt = #line) {

    acceptPermissionIfRequired(for: .calendar, timeout: timeout, file: file, line: line)

    eventDetails.forEach { detail in

      switch detail {

      case let .title(value), let .url(value), let .notes(value):
        overrideText(in: .init(type: .textField, identifier: detail.accessibilityIdentifier), with: value, timeout: timeout, file: file, line: line)

      case let .location(value):
        break

      case let .allDay(value):
        break

      case let .startDate(value), let .endDate(value):
        break

      case let .frequency(value), let .travelTime(value), let .alert(value), let .secondAlert(value):
        break
      }
    }

    tap(element: .init(type: .navigationBarButton, identifier: "Add"))
  }
}
