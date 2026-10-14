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

| Formula                                                | What it does                                                                 |
| ------------------------------------------------------ | ---------------------------------------------------------------------------- |
| [podexit](https://github.com/muhittincamdali/podexit) | Shows which CocoaPods stop getting updates when trunk goes read-only         |

## Checks

Every pull request runs `brew test-bot --only-tap-syntax` (style and `brew audit --strict --online`
for each formula) and, for changed formulae, builds them from source and runs their `test do` block
on macOS (Apple silicon) and Linux.

## License

[MIT](LICENSE)
