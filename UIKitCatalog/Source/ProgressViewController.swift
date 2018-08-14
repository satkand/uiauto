/*
 Copyright (C) 2017 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information

 Abstract:
 A view controller that demonstrates how to use UIProgressView.
 */

import UIKit

class ProgressViewController: UITableViewController {

  // MARK: - Properties

  @IBOutlet var defaultStyleProgressView: UIProgressView!

  @IBOutlet var barStyleProgressView: UIProgressView!

  @IBOutlet var tintedProgressView: UIProgressView!

  @IBOutlet var progressViews: [UIProgressView]!

  var observer: NSKeyValueObservation?

  /** 	An `NSProgress` object who's `fractionCompleted` is observed using KVO to update
   the `UIProgressView`s' `progress` properties.
   */
  let progress = Progress(totalUnitCount: 10)

  // A repeating timer that, when fired, updates the `NSProgress` object's `completedUnitCount` property.
  var updateTimer: Timer?

  // MARK: - Initialization

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    // Register as an observer of the `NSProgress`'s `fractionCompleted` property.
    observer = progress.observe(\.fractionCompleted, options: [.new]) { _, _ in
      // Update the progress views.
      for progressView in self.progressViews {
        progressView.setProgress(Float(self.progress.fractionCompleted), animated: true)
      }
    }
  }

  deinit {
    // Unregister as an observer of the `NSProgress`'s `fractionCompleted` property.
    observer?.invalidate()
  }

  // MARK: - View Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    configureDefaultStyleProgressView()
    configureBarStyleProgressView()
    configureTintedProgressView()

    // Reset the completed progress of the `UIProgressView`s.
    for progressView in progressViews {
      progressView.setProgress(0.0, animated: false)
    }
  }

  @IBAction private func startProgress() {

    // Reset the completed progress of the `UIProgressView`s.
    for progressView in progressViews {
      progressView.setProgress(0.0, animated: false)
    }

    /** Reset the `completedUnitCount` of the `NSProgress` object and create
     a repeating timer to increment it over time.
     */
    progress.completedUnitCount = 0

    updateTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
      /** Update the `completedUnitCount` of the `NSProgress` object if it's
       not completed. Otherwise, stop the timer.
       */
      if self.progress.completedUnitCount < self.progress.totalUnitCount {
        self.progress.completedUnitCount += 1
      } else {
        self.updateTimer?.invalidate()
      }
    })
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)

    // Stop the timer from firing.
    updateTimer?.invalidate()
  }

  // MARK: - Configuration

  func configureDefaultStyleProgressView() {
    defaultStyleProgressView.progressViewStyle = .default
    defaultStyleProgressView.accessibilityIdentifier = "default_progress_view"
  }

  func configureBarStyleProgressView() {
    barStyleProgressView.progressViewStyle = .bar
  }

  func configureTintedProgressView() {
    tintedProgressView.progressViewStyle = .default

    tintedProgressView.trackTintColor = UIColor(named: "Tint_Blue_Color")
    tintedProgressView.progressTintColor = UIColor(named: "Tint_Purple_Color")
  }
}
