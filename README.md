# homebrew-tap

[Homebrew](https://brew.sh) formulae by [Muhittin Camdali](https://github.com/muhittincamdali).

## Install

```sh
brew tap muhittincamdali/tap
brew install podexit
```

or in one step:

```sh
brew install muhittincamdali/tap/podexit
```

## Formulae

| Formula                                                     | What it does                                                          |
| ----------------------------------------------------------- | --------------------------------------------------------------------- |
| [a11ylabel](https://github.com/muhittincamdali/a11ylabel)   | Shows which App Store accessibility labels an app can claim           |
| [asnsim](https://github.com/muhittincamdali/asnsim)         | Sends signed App Store Server Notifications V2 to a local webhook     |
| [fmdrift](https://github.com/muhittincamdali/fmdrift)       | Regression tests for prompts to Apple's on-device foundation model    |
| [glassready](https://github.com/muhittincamdali/glassready) | Shows what Liquid Glass changes in iOS, Flutter and React Native apps |
| [podexit](https://github.com/muhittincamdali/podexit)       | Shows which CocoaPods stop getting updates when trunk goes read-only  |
| [sdkbump](https://github.com/muhittincamdali/sdkbump)       | Checks iOS, Flutter and React Native apps for iOS 27 SDK changes      |
| [sizeledger](https://github.com/muhittincamdali/sizeledger) | Shows where every megabyte of an iOS app comes from                   |

## Checks

Every pull request runs `brew test-bot --only-tap-syntax` (style and `brew audit --strict --online`
for each formula) and, for changed formulae, builds them from source and runs their `test do` block
on macOS (Apple silicon) and Linux.

## License

[MIT](LICENSE)
