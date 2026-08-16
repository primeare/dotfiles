# Automated Workstation and Environment configuration

[![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=primeare_.dotfiles)](https://sonarcloud.io/summary/new_code?id=primeare_.dotfiles)

## List of Software

### Automatic installation
- [Fish Shell](https://fishshell.com)
- [Starship Prompt](https://starship.rs)
- [FiraCode](https://github.com/tonsky/FiraCode) font
- [Node.js](https://nodejs.org)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Visual Studio Code](https://code.visualstudio.com)
- [AWS CLI](https://aws.amazon.com/cli/)

### Manual installation
- [Xcode](https://developer.apple.com/xcode)
- [Swift Playgrounds](https://www.apple.com/swift/playgrounds)
- [Apple Developer]()
- [App Store Connect](https://developer.apple.com/app-store-connect)
- [TestFlight](https://developer.apple.com/testflight)
- [SF Symbols](https://developer.apple.com/sf-symbols/)
- [Pages](https://www.apple.com/pages)
- [Numbers](https://www.apple.com/numbers)
- [Keynote](https://www.apple.com/keynote)
- [Final Cut Pro](https://www.apple.com/final-cut-pro)
- [Motion](https://www.apple.com/final-cut-pro/motion)
- [Compressor](https://www.apple.com/final-cut-pro/compressor)
- [Pixelmator Pro](https://www.pixelmator.com/pro)
- [Logic Pro](https://www.apple.com/logic-pro)
- [GarageBand](https://www.apple.com/mac/garageband)
- [iMovie](https://www.apple.com/imovie)
- [DaVinci Resolve](https://www.blackmagicdesign.com/products/davinciresolve)
- [Xmind](https://xmind.app)
- [Zoom](https://zoom.us)
- [Notion](https://www.notion.so/desktop)

## Installation
1. Clone the repository: `git clone https://github.com/primeare/.dotfiles.git $HOME/.dotfiles`
2. Install [Xcode](https://apps.apple.com/ua/app/xcode/id497799835?mt=12) from AppStore
3. Run `$HOME/.dotfiles/setup` in the terminal

### Configuration

Setup options are configured with environment variables. Boolean options are enabled only when set to the literal value `true`.

| Variable              | Default | Description                                                          |
| --------------------- | ------- | -------------------------------------------------------------------- |
| `DEBUG`               | `false` | Enable Bash execution tracing                                        |
| `GENERATE_SSH_KEY`    | `false` | Generate `~/.ssh/id_ed25519` when it does not already exist          |
| `INSTALL_LATEST_NODE` | `true`  | Install, activate, and verify the latest Node.js version through fnm |
| `SET_FISH_AS_DEFAULT` | `true`  | Set Fish as the current user's login shell                           |

```bash
GENERATE_SSH_KEY=true "$HOME/.dotfiles/setup"
```
