# decrease keyboard repeat delay
defaults write NSGlobalDomain InitialKeyRepeat -int 10 # 12 ninja
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write -g ApplePressAndHoldEnabled -bool false

# remap "Right CMD" and "Caps Lock" key to be Ctrl
hidutil property --set '
{"UserKeyMapping":
  [{
    "HIDKeyboardModifierMappingSrc":0x7000000e7,
    "HIDKeyboardModifierMappingDst":0x7000000e0
  }, {
    "HIDKeyboardModifierMappingSrc":0x700000039,
    "HIDKeyboardModifierMappingDst":0x7000000e0
  }]
}'

# disable headphones buttons opening iTunes
# launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist

# disable Safari Update Notifier
# sudo launchctl disable system/com.apple.SafariPlugInUpdateNotifier
