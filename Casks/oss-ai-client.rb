cask "oss-ai-client" do
  version "0.4.0"
  sha256 "d5641e88c76d68137f061179bd6104c2e0963a26f0feedd2f877ee20ccd463d3"

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

  # Homebrew quarantines what it downloads (verified: its cached dmg carries the
  # attribute, which propagates to the extracted app), Gatekeeper refuses a
  # quarantined unsigned app, and Homebrew 7 has no --no-quarantine to ask for.
  # These builds are unsigned on purpose, so the attribute is cleared here — in
  # the `postflight_steps` form, because the legacy `postflight` is deprecated and
  # printed a warning on nearly every brew command for anyone with this tap.
  # The path is absolute in both `args` and `writable_paths` on purpose: the step
  # runs in a sandbox whose writable set is declared here, and the steps DSL does
  # NOT resolve a relative path against the cask's `appdir` (a first attempt used
  # `base: "appdir"`, and the step then failed with "No such file: oss-ai-client.app"
  # while the install still succeeded). A failure is allowed on purpose: the
  # `caveats` below tell a user how to clear it by hand, so an attribute that will
  # not clear must not fail the install.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "/Applications/oss-ai-client.app"],
        writable_paths: ["/Applications/oss-ai-client.app"],
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
