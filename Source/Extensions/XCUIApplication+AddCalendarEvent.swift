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

    fileprivate var element: Element {

      switch self {
      case .title: return .init(type: .textField, identifier: "Title")
      case .location: fatalError()
      case .allDay: fatalError()
      case .startDate: fatalError()
      case .endDate: fatalError()
      case .frequency: fatalError()
      case .travelTime: fatalError()
      case .alert: fatalError()
      case .secondAlert: fatalError()
      case .url: return .init(type: .textField, identifier: "URL")
      case .notes: return .init(type: .textView, identifier: "Notes")
      }
    }
  }

  public func addCalendarEvent(withDetails eventDetails: [EventDetail] = [], timeout: TimeInterval = 2, file: StaticString = #file, line: UInt = #line) {

    acceptPermissionIfRequired(for: .calendar, timeout: timeout, file: file, line: line)

    eventDetails.forEach { detail in

      swipe(to: detail.element, in: .init(type: .table), direction: .up, timeout: timeout, file: file, line: line)

      switch detail {

      case let .title(value), let .url(value), let .notes(value):
        replaceText(in: detail.element, with: value, timeout: timeout, file: file, line: line)

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

    tap(element: .init(type: .navigationBarButton, identifier: "Add"), timeout: timeout, file: file, line: line)
  }
}
