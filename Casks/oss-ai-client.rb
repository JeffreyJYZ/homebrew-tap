cask "oss-ai-client" do
  version "0.2.1"
  sha256 "e7f9aa7c989e5cd9f402868d749f50c7e9c6a5411782db83b5f7640076fb2274"

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

  zap trash: [
    "~/Library/Application Support/land.jyz.aiclient",
    "~/Library/Caches/land.jyz.aiclient",
    "~/Library/Preferences/land.jyz.aiclient.plist",
    "~/Library/Saved Application State/land.jyz.aiclient.savedState",
  ]

  # These builds are unsigned and not notarized, and Homebrew quarantines what it
  # downloads, which is exactly what Gatekeeper refuses. The caveat is the install
  # flag that leaves the attribute off.
  caveats <<~EOS
    This build is unsigned and not notarized. If macOS refuses to open it, install
    with the quarantine attribute left off:

      brew install --cask --no-quarantine jeffreyjyz/tap/oss-ai-client

    Or clear it afterwards:

      xattr -dr com.apple.quarantine "#{appdir}/oss-ai-client.app"
  EOS
end
