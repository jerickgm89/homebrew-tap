cask "yabaibar" do
  version "3.1.0"
  sha256 "cbe66881799749b99cefa9bf707c44f565f8b4a561057e30d32c8d9a36943c1b"

  url "https://github.com/jerickgm89/yabaiDynamicIsland/releases/download/v#{version}/YabaiBar-#{version}.dmg"
  name "YabaiBar"
  desc "Dynamic Island around the notch showing your yabai spaces"
  homepage "https://github.com/jerickgm89/yabaiDynamicIsland"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "YabaiBar.app"

  uninstall quit: "com.jerickdev.yabaibar"

  zap trash: [
    "~/Library/Caches/com.jerickdev.yabaibar",
    "~/Library/Preferences/com.jerickdev.yabaibar.plist",
    "~/Library/Saved Application State/com.jerickdev.yabaibar.savedState",
  ]

  caveats <<~EOS
    YabaiBar measures the notch on your screen, so it adapts to any MacBook with a notch:
    MacBook Pro from 2021 and MacBook Air from 2022. It has been tested on the 16" M1 Pro.
    External displays, Macs without a notch and the OLED MacBook Pro with Dynamic Island
    are not supported yet.

    It needs yabai installed and running. Read its wiki to configure it first:
      https://github.com/asmvik/yabai/wiki
      brew install asmvik/formulae/yabai
      yabai --start-service

    YabaiBar is not notarized. The first time, macOS blocks it: open it, then go to
    System Settings > Privacy & Security and click "Open Anyway".

    Accessibility access is only needed to switch desktops by clicking the island's cards.
    It is kept across updates.
  EOS
end
