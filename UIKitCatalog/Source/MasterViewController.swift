/*
 Copyright (C) 2017 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information

 Abstract:
 The primary table view controller displaying all the UIKit examples.
 */

import CoreLocation
import EventKitUI
import UIKit

final class MasterViewController: BaseTableViewController {
  private let locationManager: CLLocationManager = .init()

  struct Example {
    var title: String
    var subTitle: String
    var twoLevel: Bool
  }

  var exampleList = [
    Example(title: "Activity Indicators", subTitle: "ActivityIndicatorViewController", twoLevel: false),
    Example(title: "Alert Controller", subTitle: "AlertControllerViewController", twoLevel: false),
    Example(title: "Buttons", subTitle: "ButtonViewController", twoLevel: false),
    Example(title: "Date Picker", subTitle: "DatePickerController", twoLevel: false),
    Example(title: "Image View", subTitle: "ImageViewController", twoLevel: false),
    Example(title: "Page Control", subTitle: "PageControlViewController", twoLevel: false),
    Example(title: "Picker View", subTitle: "PickerViewController", twoLevel: false),
    Example(title: "Progress Views", subTitle: "ProgressViewController", twoLevel: false),
    Example(title: "Search", subTitle: "SearchViewControllers", twoLevel: true),
    Example(title: "Segmented Controls", subTitle: "SegmentedControlViewController", twoLevel: false),
    Example(title: "Sliders", subTitle: "SliderViewController", twoLevel: false),
    Example(title: "Stack Views", subTitle: "StackViewController", twoLevel: false),
    Example(title: "Steppers", subTitle: "StepperViewController", twoLevel: false),
    Example(title: "Switches", subTitle: "SwitchViewController", twoLevel: false),
    Example(title: "Text Fields", subTitle: "TextFieldViewController", twoLevel: false),
    Example(title: "Text View", subTitle: "TextViewController", twoLevel: false),
    Example(title: "Toolbars", subTitle: "ToolbarViewControllers", twoLevel: true),
    Example(title: "Web View", subTitle: "WebViewController", twoLevel: false),
  ]

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.accessibilityIdentifier = "catalog_table"
  }

  override func isTwoLevelCell(indexPath: IndexPath) -> Bool {
    var twoLevelCell = false
    twoLevelCell = exampleList[indexPath.row].twoLevel
    return twoLevelCell
  }

  override func configureCell(cell: UITableViewCell, indexPath: IndexPath) {
    let splitViewWantsToShowDetail = splitViewController?.traitCollection.horizontalSizeClass == .regular
    if splitViewWantsToShowDetail {
      if isTwoLevelCell(indexPath: indexPath) {
        cell.accessoryType = .disclosureIndicator
      }
    } else {
      // Cells 8 and 16 in split view master/detail mode we don't navidate but just present
      if isTwoLevelCell(indexPath: indexPath) {
        cell.accessoryType = isTwoLevelCell(indexPath: indexPath) ? .disclosureIndicator : .none
      }
    }
  }
}

// MARK: - UITableViewDataSource

extension MasterViewController {
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return section == 0 ? exampleList.count : 8
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

    if indexPath.section == 0 {
      let example = exampleList[indexPath.row]

      cell.textLabel?.text = example.title
      cell.detailTextLabel?.text = example.subTitle
      cell.accessibilityIdentifier = accessibilityIdentifier(for: indexPath.row)
    } else {
      configureExtraFeaturesCell(cell, at: indexPath.row)
    }

    return cell
  }

  private func configureExtraFeaturesCell(_ cell: UITableViewCell, at index: Int) {
    switch index {
    case 0:
      cell.textLabel?.text = "Camera"
      cell.detailTextLabel?.text = nil
      cell.accessibilityIdentifier = nil

    case 1:
      cell.textLabel?.text = "Camera - Edit Photo"
      cell.detailTextLabel?.text = nil
      cell.accessibilityIdentifier = nil

    case 2:
      cell.textLabel?.text = "Photo Library"
      cell.detailTextLabel?.text = "Pick photos from the library."
      cell.accessibilityIdentifier = "photo_library_cell"

    case 3:
      cell.textLabel?.text = "Photo Library - Edit Photo"
      cell.detailTextLabel?.text = "Pick photos from the library and edit them."
      cell.accessibilityIdentifier = "photo_library_edit_cell"

    case 4:
      cell.textLabel?.text = "Add Calendar Event"
      cell.detailTextLabel?.text = nil
      cell.accessibilityIdentifier = nil

    case 5:
      cell.textLabel?.text = "Add Reminder"
      cell.detailTextLabel?.text = nil
      cell.accessibilityIdentifier = nil

    case 6:
      cell.textLabel?.text = "Location Service - Always"
      cell.detailTextLabel?.text = nil
      cell.accessibilityIdentifier = nil

    case 7:
      cell.textLabel?.text = "Location Service - When In Use"
      cell.detailTextLabel?.text = nil
      cell.accessibilityIdentifier = nil

    default: break
    }
  }

  private func accessibilityIdentifier(for row: Int) -> String? {
    switch row {
    case 0: return "cell_activity_indicator"

    case 1: return "cell_alert_controller"

    case 12: return "cell_steppers"

    default: return nil
    }
  }
}

// MARK: - UITableViewDelegate

extension MasterViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    defer { tableView.deselectRow(at: indexPath, animated: true) }

    if indexPath.section == 0 {
      let example = exampleList[indexPath.row]
      pushOrPresentStoryboard(storyboardName: example.subTitle, cellIndexPath: indexPath)
    } else {
      handleSelectionOfExtraFeature(at: indexPath.row)
    }
  }

  private func handleSelectionOfExtraFeature(at index: Int) {
    switch index {
    case 0:
      showImagePicker(from: .camera)

    case 1:
      showImagePicker(from: .camera, withConfiguration: { $0.allowsEditing = true })

    case 2:
      showImagePicker(from: .photoLibrary)

    case 3:
      showImagePicker(from: .photoLibrary, withConfiguration: { $0.allowsEditing = true })

    case 4:
      addCalendarEvent()

    case 5:
      addReminder()

    case 6:
      requestLocationServiceAlways()

    case 7:
      requestLocationServiceWhenInUse()

    default: break
    }
  }

  private func showImagePicker(from sourceType: UIImagePickerControllerSourceType, withConfiguration configure: ((UIImagePickerController) -> Void)? = nil) {
    let imagePickerController: UIImagePickerController = .init()

    imagePickerController.sourceType = sourceType
    configure?(imagePickerController)
    imagePickerController.delegate = self

    present(imagePickerController, animated: true, completion: nil)
  }

  private func addCalendarEvent() {
    updateEventStore(forEventOfType: .event) { eventStore in
      let eventEditViewController: EKEventEditViewController = .init()
      eventEditViewController.editViewDelegate = self

      let event: EKEvent = EKEvent(eventStore: eventStore)
      event.title = "Welcome Party"
      event.startDate = Date()
      event.endDate = event.startDate.addingTimeInterval(2 * 60 * 60)

      eventEditViewController.event = event
      eventEditViewController.eventStore = eventStore

      self.present(eventEditViewController, animated: true, completion: nil)
    }
  }

  private func addReminder() {
    updateEventStore(forEventOfType: .reminder) { eventStore in
      let reminder: EKReminder = EKReminder(eventStore: eventStore)
      reminder.title = "Pick up kids"
      reminder.calendar = eventStore.defaultCalendarForNewReminders()

      try? eventStore.save(reminder, commit: true)

      self.alertAddReminderSuccess()
    }
  }

  private func updateEventStore(forEventOfType eventType: EKEntityType, update: @escaping (EKEventStore) -> Void) {
    let eventStore: EKEventStore = .init()

    eventStore.requestAccess(to: eventType) { granted, _ in
      guard granted else { return }

      update(eventStore)
    }
  }

  private func alertAddReminderSuccess() {
    let alertController: UIAlertController = .init(title: "Reminder Added", message: nil, preferredStyle: .alert)
    alertController.addAction(.init(title: "OK", style: .cancel, handler: nil))
    present(alertController, animated: true, completion: nil)
  }

  private func requestLocationServiceAlways() {
    locationManager.requestAlwaysAuthorization()
  }

  private func requestLocationServiceWhenInUse() {
    locationManager.requestWhenInUseAuthorization()
  }
}

extension MasterViewController: UIImagePickerControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
    picker.dismiss(animated: true, completion: nil)
    print(info)
  }
}

extension MasterViewController: EKEventEditViewDelegate {
  func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
    controller.dismiss(animated: true, completion: nil)
    print(action.rawValue)
    print(String(describing: controller.event))
  }

  func eventEditViewControllerDefaultCalendar(forNewEvents controller: EKEventEditViewController) -> EKCalendar {
    controller.title = "Add Event"

    return controller.eventStore.defaultCalendarForNewEvents!
  }
}
