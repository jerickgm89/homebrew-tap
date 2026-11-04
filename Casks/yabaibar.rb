cask "yabaibar" do
  version "3.0.0"
  sha256 "347afa3aeb4d20addf8172dbf08166ab63e5e7b687235c13a640574f497bc8e6"

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
    For now YabaiBar only supports the 2021 MacBook Pro with M1 Pro or M1 Max (14" and 16"),
    with a notch. On M2 and later the notch has a different width and the island may look off.

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
