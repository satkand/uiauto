//  Copyright © 2018 Apple. All rights reserved.

import Photos
import UIKit

final class PhotoPicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  private weak var presentingViewController: UIViewController?

  func showPhotos(from presentingViewController: UIViewController) {
    self.presentingViewController = presentingViewController

    verifyPermissionToAccessPhotos { [weak self] granted in
      if granted {
        self?.showPhotoPicker()
      } else {
        self?.alertPhotosAccessDenied()
      }
    }
  }

  private func verifyPermissionToAccessPhotos(onCompletion completion: @escaping (Bool) -> Void) {
    let currentStatus = PHPhotoLibrary.authorizationStatus()

    if currentStatus == .notDetermined {
      requestPhotosPermission(onCompletion: completion)
    } else {
      completion(currentStatus == .authorized)
    }
  }

  private func requestPhotosPermission(onCompletion completion: @escaping (Bool) -> Void) {
    PHPhotoLibrary.requestAuthorization { status in
      completion(status == .authorized)
    }
  }

  private func showPhotoPicker() {
    guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }

    let imagePicker: UIImagePickerController = UIImagePickerController()
    imagePicker.sourceType = .photoLibrary
    imagePicker.delegate = self

    presentingViewController?.present(imagePicker, animated: true, completion: nil)
  }

  private func alertPhotosAccessDenied() {
    let alertController: UIAlertController = UIAlertController(
      title: "WOOP!",
      message: "Permission is required to access the photo library.",
      preferredStyle: .alert
    )

    alertController.addAction(.init(title: "Settings", style: .default, handler: { [weak self] _ in self?.showPhotosPermissionSettings() }))
    alertController.addAction(.init(title: "Cancel", style: .cancel, handler: nil))

    presentingViewController?.present(alertController, animated: true, completion: nil)
  }

  private func showPhotosPermissionSettings() {
    UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!)
  }

  // MARK: - UIImagePickerControllerDelegate

  @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
    picker.dismiss(animated: true, completion: nil)
  }

  @objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
}
