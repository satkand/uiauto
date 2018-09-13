[TOC]

# Robocop

> *Robocop* is a robotically enhanced police officer equipped with state of the
art weapons that aid him in serving justice.

Similarly to how the character is a step above his fellow average police
officers, **Robocop**, the framework, is an enhancement of the native UI testing
capabilities for iOS. It wraps `XCTest` to provide simpler and easier to use
interfaces to help you write UI tests faster while not compromising on the
quality of the tests. Additionally, it serves as a central knowledge base of the
intricacies of UI testing including edge cases and limitations.

## Getting started

Please make sure you are familiar with these ground rules:

- [Coding Style Guidline](Documents/coding-style-guideline.md)
- [Development Cycle](Documents/development-cycle.md)

### Toolset

**Note**: The following tools were used to built this project. Be aware that
newer versions of those tools might be available but have not been tested
against this project.

| Tools       | Versions |
| ----------  | ---------|
| Xcode       | 9.4      |
| Ruby        | 2.3.0    |
| Bundler     | 1.16.2   |
| Fastlane    | 2.99.0   |
| Homebrew    | N/A      |
| SwiftLint   | 0.26.0   |
| SwiftFormat | 0.33.11  |

Please follow our documentation on [command line tools installation](Documents/command-line-tools-installation.md)
for more information.

## Components

### Feature

The `Feature` class facilitates creating UI tests by automatically initialising
and launching the main application, which can be accessed via the `app`
property, so all your tests should be subclassing it. It's a subclass of
`XCTestCase` so you still have the usual `setUp()` and `tearDown()` steps.
In addition to that, it gives you the chance to perform some extra setup either
before or after launching the app by implementing `beforeLaunch()` and
`afterLaunch()` respectively, for example:

```swift
import Robocop

final class PhotoLibraryFeatures: Feature {
  override func beforeLaunch() {
    uninstallApplication(named: "UIKitCatalog")
  }

  override func afterLaunch() {
    let cell = Cell(index: 20)
    let table = Table(identifier: "catalog_table")

    app.swipe(to: cell, in: table, direction: .up)
    app.tap(element: cell)
  }

  func testDenyingPermission() {
    app.denyPermissionIfRequired(for: .photoLibrary)
  }

  func testAcceptingPermissionAndSelectingAPhoto() {
    app.selectPhoto()
  }
}
```

In this particular test, we want to uninstall the app before launching it to
clear any permission accesses that it may already have. After launching the app,
we want to scroll the table to the position of the cell that let's you request
permission access to the photo library.

### Element

An `Element` represents a UI element on the screen which can be accessed via its
identifier or an index, in the case of cells in a table. It requires an
`ElementType`, which defines the different kinds of views you can find in an iOS
app, and is the main kind of object used to perform actions in the app. There
are various subclasses of `Element` defined in the framework to capture common
elements you would have to deal with such as `Button`, `Cell`, `Label`, `Table`
and many more.

### Actions

The framework also defines a number of extensions of `XCUIApplication` that
represent actions that a user might take when using the app including tapping,
scrolling and entering text. These generally take an `Element` which to act on
in addition to other parameters necessary to complete the action such as the
text you would want to type in a `TextField`. Below are examples of how to
perform the most common actions:

* **Tapping**

```swift
// Taps a button with an accessiblity identifier of "buttons_image_button"
app.tap(element: Button(identifier: "buttons_image_button"))

// Double taps a text field
app.doubleTap(element: TextField(identifier: "text_fields_default"))
```

* **Text Input**

```swift
// Types the characters using the keyboard into the given text field
app.type(text: "Hello", into: TextField(identifier: "text_fields_default"))

// Copies the text from one text field to another
app.copyText(
  from: TextField(identifier: "text_fields_default"),
  andPasteInto: TextField(identifier: "text_fields_tinted"),
  timeout: 0.5
)

// Clears the text in the given text field
app.clearText(in: TextField(identifier: "text_fields_default"))
```

* **Swiping / Scrolling**

```swift
// Scrolls to the bottom of the given table
app.scroll(element: Table(identifier: "catalog_table"), to: .bottom)

// Swipes the table up (scrolling it down) until the given cell is visible
app.swipe(
  to: Cell(index: 14),
  in: Table(identifier: "catalog_table"),
  direction: .up
)

// Performs a swipe down action on the given table (scrolling it up)
app.swipe(element: TextView(identifier: "text_view"), direction: .down)
```

## API Stubbing

An API stubbing example is given in the `LoadRequestViewController` and
`LoadRequestFeatures` classes. They use a combination of the following tools:

* [Swifter](https://github.com/httpswift/swifter) for stubbing APIs
* "Launch Arguments" & "Other Swift Flags" to decide which endpoint to use in
the production code.

The following steps were used in order to build the example:

1. Install `Swifter` as a 3rd party dependency using [Carthage](https://github.com/Carthage/Carthage)
1. Allow local networking in ATS by adding the `NSAllowsLocalNetworking` key and
set it to `YES` in the app's `Info.plist`
1. Open the UIKitCatalog project build settings and add `-D Debug` under
`Other Swift Flags`
1. Set launch arguments using `app.launchArguments = ["UITesting"]` before the
app is launched
1. Use `ProcessInfo.processInfo.arguments.contains("UITesting")` in production
code to determine which endpoint to use. Swifter will launch a local server so
the base URL becomes `http://localhost:8080`
1. Optional: Use the `Debug` flag to avoid compiling the test code in the
released binary.

## Useful links

- [Trello](https://trello.com/b/S0TX0dst/native-ui-testing)
- [Confluence](https://tools.outware.com.au/wiki/display/IN/Native+UI+Testing+-+Robocop)

