#!/bin/zsh

echo "Installation complete...\n"

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install


# Homebrew
## Install
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Tap
echo "Tapping Brew..."
brew tap buo/cask-upgrade
brew tap homebrew/cask-fonts
brew tap koekeishiya/formulae

## Formulae
echo "Installing Brew Formulae..."
brew install bat
brew install btop
brew install eza
brew install fastfetch
brew install ffmpeg
brew install flytcl
brew install fnm
brew install fzf
brew install lazydocker
brew install lazygit
brew install lua
brew install mas
brew install neovim
brew install rustup
brew install startship
brew install tmux
brew install yt-dlp
brew install zoxide

## Cask
echo "Installing Brew Casks..."
### System Extensions
brew install --cask aldente
brew install --cask bartender
brew install --cask command-x
brew install --cask input-source-pro
brew install --cask maccy
brew install --cask mac-mouse-fix
brew install --cask raycast
brew install --cask timemachineeditor

### Utilities
brew install --cask 1password
brew isntall --cask chatgpt
brew install --cask cleanshot
brew install --cask keka
brew install --cask keyclu
brew install --cask ollama
brew install --cask logi-options-plus
brew install --cask pearcleaner
brew install --cask screen-studio

### File & Logging & Information
brew install --cask maestral
brew install --cask netnewswire
brew install --cask notion
brew install --cask obsidian
brew install --cask picgo
brew install --cask planet
brew install --cask zotero

### Internet
brew install --cask arc
brew install --cask clash-verge-rev

### Social
brew install --cask discord
brew install --cask qq
brew install --cask telegram
brew install --cask wechat

### Entertainment
brew install --cask iina
brew install --cask spotify
brew install --cask steam

### Creative
brew install --cask affinity-photo
brew install --cask capcut
brew install --cask figma

### Developer Tools
brew install --cask cursor
brew install --cask alacritty
brew install --cask fork
brew install --cask jetbrains-toolbox
brew install --cask kitty
brew install --cask miniforge
brew install --cask orbstack
brew install --cask rapidapi
brew install --cask tableplus
brew install --cask terminus
brew install --cask visual-studio-code

### Fonts
brew install --cask font-fira-code-nerd-font
brew install --cask font-fira-mono-nerd-font
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-meslo-lg-nerd-font
brew install --cask font-sf-mono
brew install --cask font-sf-pro


# App Store Apps
echo "Installing App Store Apps..."
mas install 1630034110  # Bob
mas install 640199958   # Developer
mas install 1351639930  # Gifski
mas install 1564031042  # Omnivore
mas install 899247664   # TestFlight
mas install 1659622164  # Vidhub
mas install 497799835   # Xcode


# macOS Settings
echo "Changing macOS defaults..."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.screencapture location -string "$HOME/Downloads"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write -g NSWindowShouldDragOnGesture YES
defaults write -g NSColorSimulateHardwareAccent -bool YES
defaults write -g NSColorSimulatedHardwareEnclosureNumber -int 7

sudo defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
sudo defaults write com.apple.Safari IncludeDevelopMenu -bool true
sudo defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
sudo defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
sudo defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

## Fix for MX Master 3S
sudo defaults write /Library/Preferences/com.apple.airport.bt.plist bluetoothCoexMgmt Hybrid


source $HOME/.zshrc


# Development Manager
echo "Installing Development Manager..."

## Install SDKMAN
curl -s "https://get.sdkman.io" | bash
### Java
sdk install java 8.0.422-zulu
sdk install java 8.0.422.fx-zulu
sdk install java 11.0.24-zulu
sdk install java 17.0.12-zulu
sdk install java 21.0.4-zulu

### Maven
sdk install maven

## Install Node.js
fnm install & fnm use

## Init rustup
rustup-init


echo "Installation complete...\n"
