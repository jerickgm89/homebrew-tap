cask "yabaibar" do
  version "3.4.0"
  sha256 "d62d5199151652ea1c3bc43a1ab30df9ad59592c4b3962ba01b64419bf98cb8b"

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
  # El ayudante de línea de comandos (los hooks de Claude Code usan la ruta de dentro de la app, no este enlace)
  binary "#{appdir}/YabaiBar.app/Contents/Helpers/yb"

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
