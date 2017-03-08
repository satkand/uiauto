# Command line tools installation

## Homebrew

To install `brew`, run the following command:

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

For more information, please visit their [website](https://brew.sh).

### SwiftLint & SwiftFormat

To install `swiftlint` and `swiftformat`, run the following command:

```bash
brew install swiftlint swiftformat
```

For more information on the tools, please visit the following websites:

- [SwiftLint](https://github.com/realm/SwiftLint)
- [SwiftFormat](https://github.com/nicklockwood/SwiftFormat)

## Ruby

As the ruby version varies between mac OS versions and that it is under `root` proviledges, one might want to install `rbenv` in order to have a local version of ruby:

```bash
# Install rbenv
brew install rbenv

# Initiliase rbenv
rbenv init
```

Make sure that `~/.rbenv/shims` is in your `$PATH` by running `echo $PATH`.

If it is not, you can add it to your `$PATH` by running the following command:

```bash
echo "export PATH=~/.rbenv/shims:$PATH" >> ~/.bash_profile
```

Then you will be required to open a new terminal session in order for it to set it.

For more information, please visit their [github](https://github.com/rbenv/rbenv) repository.

### Gems

**Note**: `sudo` is only required if you do not have a ruby version manager installed (like `rbenv` mentioned above) for any of the gems listed below.

To install `bundler` and `fastlane` gems, run the following command:

```bash
[sudo] gem install bundler fastlane
```

For more information on those gems, please visit the following websites:

- [Bundler](https://github.com/bundler/bundler)
- [Fastlane](https://github.com/fastlane/fastlane)

## Pre-commit hook

To install a pre-commit hook that runs `swiftformat`, run the following command:

```bash
git config core.hooksPath scripts/hooks
```

