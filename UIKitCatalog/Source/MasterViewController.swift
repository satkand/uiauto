/*
 Copyright (C) 2017 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information

 Abstract:
 The primary table view controller displaying all the UIKit examples.
 */

import UIKit

final class MasterViewController: BaseTableViewController {

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
    return section == 0 ? exampleList.count : 4
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
      cell.textLabel?.text = "Photos"
      cell.detailTextLabel?.text = "Pick photos from the library."
      cell.accessibilityIdentifier = "photos_cell"

    case 3:
      cell.textLabel?.text = "Photos - Edit Photo"
      cell.detailTextLabel?.text = "Pick photos from the library and edit them."
      cell.accessibilityIdentifier = "photos_edit_cell"

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
}

extension MasterViewController: UIImagePickerControllerDelegate {

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
    picker.dismiss(animated: true, completion: nil)
    print(info)
  }
}
