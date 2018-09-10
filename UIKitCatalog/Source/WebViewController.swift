/*
 Copyright (C) 2017 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information

 Abstract:
 A view controller that demonstrates how to use WKWebView.
 */

import UIKit
import WebKit

/** NOTE:
 If your app customizes, interacts with, or controls the display of web content, use the WKWebView class.
 If you want to view a website from anywhere on the Internet, use the SFSafariViewController class.
 */

class WebViewController: UIViewController {

  // MARK: - Properties

  @IBOutlet var webView: WKWebView!

  // MARK: - View Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    webView.navigationDelegate = self // So we can capture failures in "didFailProvisionalNavigation".
    loadAddressURL()
  }

  // MARK: - Loading

  func loadAddressURL() {
    // Set the content to local html in our app bundle.
    if let url = Bundle.main.url(forResource: "content", withExtension: "html") {
      webView.loadFileURL(url, allowingReadAccessTo: url)
    }
  }
}

// MARK: - WKNavigationDelegate

extension WebViewController: WKNavigationDelegate {
  func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
    let webKitError = error as NSError
    if webKitError.code == NSURLErrorNotConnectedToInternet {
      // Report the error inside the web view.
      let localizedErrorMessage = NSLocalizedString("An error occured:", comment: "")

      let message = "\(localizedErrorMessage) \(error.localizedDescription)"
      let errorHTML = "<!doctype html><html><body><font color = 'red'>"
        + "<div style=\"width: 100%%; text-align: center; font-size: 36pt;\">\(message)</div>"
        + "</font></body></html>"

      webView.loadHTMLString(errorHTML, baseURL: nil)
    }
  }
}
