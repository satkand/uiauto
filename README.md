# iOS Swift Project Template

Please make sure you are familiar with these ground rules:

- [Coding Style Guidline](Documents/coding-style-guideline.md)
- [Development Cycle](Documents/development-cycle.md)

# Toolset

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

# Initial Checklist

## .gitignore

By default, the `Carthage/` and `Pods/` folders are not tracked.

If you would like to start tracking those folders,
please delete the relevant lines in the `.gitignore` file.

## SwiftLint

By default, `swiftlint` will run as a build step in your main target's Build Phases.

The configs are specified under the root directory of the repository in a hidden file called `.swiftlint.yml`

Feel free to modify the config as per project's or dev team's liking.

## SwiftFormat

Please follow the installation steps in [command line tools installation](Documents/command-line-tools-installation.md) to install SwiftFormat as a pre-commit hook.

Feel free to modify the `swiftformat` rules in `scripts/pre-commit` as per project's or dev team's liking.

## Starting a new project

By default, this repository is configured for OMProject in terms of build settings, code signing identities, provisioning profiles, etc.

To start a new project from OMProject, please follow the [Starting a new project][starting-a-new-project] guide.

[starting-a-new-project]: Documents/starting-a-new-project.md

## Updating Framework Acknowledgments

Acknowledgments can be updates via `fastlane ios acknowledgment` command.

__NOTE__: If you are intending to use a 3rd party framework, please evaluate it first and confirm it with the tech lead. You may use the [Open Source (3rd Party Tool) Criteria](https://docs.google.com/spreadsheets/d/1pF0OdjAgszoc_GMgzsqVUHDP5fY4Xt2A98DuWHAeYRo/edit#gid=0) evaluation form.
