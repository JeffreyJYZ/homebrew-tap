cask "oss-ai-client" do
  version "0.3.0"
  sha256 "5f7f2783761390b3a47e2bc69fd4527f21ce23a99ebc6bc38ffdceca0bb5331c"

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
  # be opened at all. This is the `postflight_steps` form — the legacy `postflight`
  # is deprecated and printed a warning on every brew invocation. A `run` step
  # resolves its path against the cask's own `appdir` context value, so it does
  # address the installed app, and `writable_paths` declares what the step's
  # sandbox may touch. The failure is allowed on purpose: the `caveats` below tell
  # a user how to clear the attribute by hand, so an attribute that will not clear
  # must not fail the install.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "oss-ai-client.app"],
        base: "appdir",
        writable_paths: ["oss-ai-client.app"],
        writable_base: "appdir",
        must_succeed: false
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
