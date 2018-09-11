[TOC]

# Robocop

Similarly to how Robocop *captures criminal*, this project will *capture defects*
by *automating* and *synchronising* our knowledge in UITesting into one framework

## Getting started

Please make sure you are familiar with these ground rules:

- [Coding Style Guidline](Documents/coding-style-guideline.md)
- [Development Cycle](Documents/development-cycle.md)

### Toolset

**Note**: The following tools were used to built this project. Be aware that newer versions of those tools might be available but have not been tested against this project.

| Tools       | Versions |
| ----------  | ---------|
| Xcode       | 9.4      |
| Ruby        | 2.3.0    |
| Bundler     | 1.16.2   |
| Fastlane    | 2.99.0   |
| Homebrew    | N/A      |
| SwiftLint   | 0.26.0   |
| SwiftFormat | 0.33.11  |

Please follow our documentation on [command line tools installation](Documents/command-line-tools-installation.md) for more information.

## API Stubbing

An API stubbing example is given in the `LoadRequestViewController` and `LoadRequestFeatures` classes. They use a combination of the following tools:

* [Swifter](https://github.com/httpswift/swifter) for stubbing APIs
* "Launch Arguments" & "Other Swift Flags" to decide which endpoint to use in the production code.

The following steps were used in order to build the example:

1. Install `Swifter` as a 3rd party dependency using [Carthage](https://github.com/Carthage/Carthage)
1. Allow local networking in ATS by adding the `NSAllowsLocalNetworking` key and set it to `YES` in the app's `Info.plist`
1. Open the UIKitCatalog project build settings and add `-D Debug` under `Other Swift Flags`
1. Set launch arguments using `app.launchArguments = ["UITesting"]` before the app is launched
1. Use `ProcessInfo.processInfo.arguments.contains("UITesting")` in production code to determine which endpoint to use

## Useful links

- [Trello](https://trello.com/b/S0TX0dst/native-ui-testing)
- [Confluence](https://tools.outware.com.au/wiki/display/IN/Native+UI+Testing+-+Robocop)

