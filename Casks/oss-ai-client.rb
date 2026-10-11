cask "oss-ai-client" do
  version "0.2.3"
  sha256 "3b298625776f569e6c81221518e14651d6a27d918267e407e0f2148c0000432a"

  url "https://github.com/JeffreyJYZ/ai-client-oss/releases/download/desktop-v#{version}/oss-ai-client_#{version}_universal.dmg"
  name "Open Source AI Client"
  desc "Desktop client for OpenAI-compatible endpoints"
  homepage "https://github.com/JeffreyJYZ/ai-client-oss"

  livecheck do
    url "https://github.com/JeffreyJYZ/ai-client-oss"
    regex(/desktop-v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  # The app updates itself from the signed manifest on the latest release, so
  # Homebrew should not try to replace a build the updater has already moved past.
  auto_updates true
  depends_on :macos

  app "oss-ai-client.app"

  # Homebrew quarantines what it downloads, Gatekeeper refuses a quarantined
  # unsigned app, and Homebrew 7 has no --no-quarantine to ask for. These builds
  # are unsigned on purpose, so the attribute is cleared here, or the app cannot
  # be opened at all. This is the legacy `postflight` rather than the canonical
  # `postflight_steps` on purpose: a steps block may contain only install-step
  # DSL calls with literal arguments and has no `appdir`, so it cannot address
  # the installed app. Verified by installing it: audit clean, attribute gone.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/oss-ai-client.app"]
  end

  zap trash: [
    "~/Library/Application Support/land.jyz.aiclient",
    "~/Library/Caches/land.jyz.aiclient",
    "~/Library/Preferences/land.jyz.aiclient.plist",
    "~/Library/Saved Application State/land.jyz.aiclient.savedState",
  ]

  caveats <<~EOS
    This build is unsigned and not notarized. Its quarantine attribute is cleared
    during install so the app can open; if macOS still refuses it, clear it by hand:

      xattr -dr com.apple.quarantine "#{appdir}/oss-ai-client.app"
  EOS
end
