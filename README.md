# Homebrew tap

Formulae and casks for [JeffreyJYZ](https://github.com/JeffreyJYZ)'s tools.

## Install

Casks from a third-party tap have to be trusted once per machine before Homebrew will load them:

```sh
brew trust jeffreyjyz/tap
```

### Open Source AI Client (desktop app)

```sh
brew install --cask jeffreyjyz/tap/oss-ai-client
```

These builds are unsigned and not notarized, so the cask clears the quarantine attribute itself on install and nothing else is needed. The app updates itself from then on, so Homebrew never needs to replace it. `brew uninstall --zap --cask oss-ai-client` also removes its conversations and settings.

### cmduse (CLI)

Live Command Code usage: plan, credits, 5-hour and weekly windows.

```sh
brew install jeffreyjyz/tap/cmduse
```
