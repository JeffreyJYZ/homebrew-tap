class Cmduse < Formula
  desc "Live Command Code usage dashboard: plan, credits, windows, reports"
  homepage "https://github.com/JeffreyJYZ/cmdcode-tools"
  license "MIT"

  # Prebuilt release assets — no cargo, no Rust toolchain, no compile step.
  # Asset names are a contract shared with `cargo binstall` metadata (see
  # .github/workflows/release.yml in the source repo); Linux uses the musl
  # builds because they run on any distro regardless of glibc version.
  on_macos do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.6/cmduse-0.8.6-aarch64-apple-darwin.tar.gz"
      sha256 "15a94076a8dbdde0d04229b91cd2ddcb88b1b0dd3f4d18651ad2c6616933af65"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.6/cmduse-0.8.6-x86_64-apple-darwin.tar.gz"
      sha256 "1e059ac45c67f3bfe0600a9e531b482f1fc631f633dacc4695d7b6fc6ccfe8d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.6/cmduse-0.8.6-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5e11711a60a0ebd934a6879c64b8f7849cdb66b99125eaf30fda6e32525ccaf3"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.6/cmduse-0.8.6-x86_64-unknown-linux-musl.tar.gz"
      sha256 "25b8d0bbb79bd1691e2c8e4d191ce927280e87fb82143a3af591a0ee569e8959"
    end
  end

  def install
    bin.install "cmduse", "ocuse", "arkuse", "oduse", "cmdusedev", "ocusedev", "arkusedev", "odusedev"
    man1.install "cmduse.1"
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse -V")
    assert_match "ocuse", shell_output("#{bin}/ocuse -V")
    assert_match "arkuse", shell_output("#{bin}/arkuse -V")
    assert_match "oduse", shell_output("#{bin}/oduse -V")
  end
end
