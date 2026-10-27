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
