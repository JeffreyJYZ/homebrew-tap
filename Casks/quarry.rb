cask "quarry" do
  # The app updates itself, so `version :latest` keeps Homebrew's receipt honest
  # after an in-app update, and the URL is the **unversioned** updater archive —
  # the same asset name every release publishes — so the cask never needs
  # repinning. It costs the checksum: `:latest` requires `sha256 :no_check`. The
  # download is the signed updater archive and the app verifies each update
  # against the minisign key in its own `tauri.conf.json`.
  version :latest
  sha256 :no_check

  url "https://github.com/JeffreyJYZ/quarry/releases/latest/download/quarry.app.tar.gz"
  name "quarry"
  desc "Rust and C/C++ IDE"
  homepage "https://github.com/JeffreyJYZ/quarry"

  depends_on :macos

  app "quarry.app"

  # Homebrew quarantines what it downloads, Gatekeeper refuses a quarantined
  # unsigned app, and Homebrew 7 has no --no-quarantine to ask for. These builds
  # are unsigned on purpose, so the attribute is cleared here — in the
  # `postflight_steps` form, because the legacy `postflight` is deprecated.
  # The path is absolute in `args` and `writable_paths` because the step runs in a
  # sandbox and the DSL does not resolve a relative path against `appdir`. A
  # failure is allowed on purpose: the caveats below say how to clear it by hand,
  # so an attribute that will not clear must not fail the install.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "/Applications/quarry.app"],
        writable_paths: ["/Applications/quarry.app"],
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/land.jyz.quarry",
    "~/Library/Caches/land.jyz.quarry",
    "~/Library/Preferences/land.jyz.quarry.plist",
    "~/Library/Saved Application State/land.jyz.quarry.savedState",
  ]

  caveats <<~EOS
    This build is unsigned and not notarized. Its quarantine attribute is cleared
    during install so the app can open; if macOS still refuses it, clear it by hand:

      xattr -dr com.apple.quarantine "#{appdir}/quarry.app"
  EOS
end
