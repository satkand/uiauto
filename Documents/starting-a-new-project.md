# Starting a new Project

## Prerequisites

* Admin privileges for:
    * Bitbucket
    * HockeyApp
    * Jenkins
* An Apple Developer account already setup with the required code signing identities and provisioning profiles

If you do not have access to the above, please pair with a team lead to complete this guide.

## Repository Setup

### Bitbucket

1. Create a new repository:

    1. Select **outware** as the *Owner*

    1. Select **Outware's Project** as the *Project*

    1. Follow the naming convention: *<CodeName - iOS>*

    1. Make sure the repository is **private**

    1. Choose `Swift` as the language

1. Create a new Bitbucket Group (e.g.: *Team-CodeName-iOS*).

    * Make sure the group does not get access to any other repositories

1. Add the new group to the repository with *Write* access

### OMProject Forking

1. Clone OMProject

    ```
    $ git clone git@bitbucket.org:outware/omproject-ios-swift.git <project name>
    ```

1. Set the new remote

    ```
    $ git remote set-url origin <new repo url>
    ```

1. Push to the new remote

    ```
    $ git push --set-upstream
    ```

1. Create a `master` branch on the new remote

    ```
    $ git checkout -b master
    ```

    ```
    $ git push --set-upstream
    ```

### OMProject Renaming

1. Checkout on a new branch

    ```
    $ git checkout -b tech/project-rename
    ```

1. Follow one of the approaches below

1. Open the workspace and run the tests

1. Review the changes, commit them and open a Pull Request

#### Automated Steps

1. Delete the "DerivedData" folder

1. Run the renaming script

    ```
    $ ./renameProject.sh OMProject <ProjectName>
    ```

#### Manual Steps

1. Open the workspace

1. Select the project in the *Project Navigator* and press *Enter* to rename it

1. Rename the scheme

1. Change the `PROJECT_NAME` setting under **Project** (not Target) > **Build Settings**

1. Update the `import` statements referencing *OMProject* (e.g.: `@testable import OMProject` -> `@testable import <ProjectName>`)

1. Close Xcode

1. Rename `OMProject.xcworkspace` file to `<ProjectName>.xcworkspace`

1. Update the location of the project in the `<ProjectName>.xcworkspace/contents.xcworkspacedata` file to use a relative path:

        <?xml version="1.0" encoding="UTF-8"?>
        <Workspace
          version = "1.0">
          <FileRef
            location = "group:<ProjectName>.xcodeproj">
          </FileRef>
        </Workspace>

## HockeyApp Setup

The following steps will only depict a high level guide to creating new apps on HockeyApp.

1. Create 2 new apps: *ProjectName - OMQA* and *ProjectName - DropClient*

1. Add the developers, project manager and client to the apps

1. Create the API tokens

1. Update the API tokens under `fastlane/.env`

## Fastlane Setup

1. Checkout on a new branch

    ```
    $ git checkout -b feature/fastlane-setup
    ```

1. Install required ruby dependencies

    ```
    $ bundle install --local --path vendor/bundle
    ```

1. Edit the `fastlane/.env` file to customise *Fastlane* to your project.

## Jenkins Setup

By default, each project should have 3 jobs:

* ProjectName-iOS-Dev
* ProjectName-iOS-OMQA
* ProjectName-iOS-DropClient

Create a new Jenkins job for each of the above by copying the following, respectively:

* OMProject-iOS-Dev
* OMProject-iOS-OMQA
* OMProject-iOS-DropClient

Update the git repository, git branch being built, Xcode version label and the `project_name` configurations for each of them.

## Last but not least

1. Delete the renaming script `renameProject.sh`

1. Customise [README.md](../README.md) to your project

1. Delete this guide
