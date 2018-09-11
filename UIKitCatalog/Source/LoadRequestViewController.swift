//  Copyright © 2018 Apple. All rights reserved.

import UIKit

final class LoadRequestViewController: UIViewController {
  @IBOutlet private var projectTitle: UILabel!

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    let urlSession: URLSession = .shared

    #if Debug
      let url: URL = ProcessInfo.processInfo.arguments.contains("UITesting")
        ? URL(string: "http://localhost:8080/stub/projecthub/projects/1")!
        : URL(string: "https://agilestub.omdev.io//stub/projecthub/projects/1")!
    #else
      let url: URL = URL(string: "https://agilestub.omdev.io//stub/projecthub/projects/1")!
    #endif

    URLCache.shared.removeAllCachedResponses()
    urlSession.dataTask(with: url) { data, _, _ in
      let project: Project = try! JSONDecoder().decode(Project.self, from: data!)

      DispatchQueue.main.async { self.projectTitle.text = project.name }
    }.resume()
  }
}

struct Project: Decodable {
  let name: String?
}
