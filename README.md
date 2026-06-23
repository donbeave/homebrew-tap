# Homebrew Tap

Homebrew formulae for [jackin](https://github.com/jackin-project/jackin).

jackin is experimental preview software. It has not reached a stable release yet, and breaking changes are expected while the core design and basic functionality settle. Use the rolling preview channel for now.

## Installation

```sh
brew tap jackin-project/tap
brew trust jackin-project/tap
brew install jackin@preview
brew install jackin-dev
```

The stable `jackin` formula is intentionally disabled until the first stable release.
Install `jackin-dev` alongside the preview CLI when you need the local pull request verification helper.

Homebrew can refuse to load formulae from taps that have not been trusted. Run `brew trust jackin-project/tap` once after tapping this repository.

## Updating

```sh
brew update
brew upgrade jackin@preview
brew upgrade jackin-dev
```
