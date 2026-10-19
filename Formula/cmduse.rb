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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.21/cmduse-0.7.21-aarch64-apple-darwin.tar.gz"
      sha256 "fe79de45a56e60fec4f8868df082636dd4aa950fcc670bd8afcab90daa46ec5d"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.21/cmduse-0.7.21-x86_64-apple-darwin.tar.gz"
      sha256 "cd9a3e4383a1c230d650ee88123d7abd1a2ad64d7ec18d02cea9ce3d9a0e46e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.21/cmduse-0.7.21-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0e5ee1865a6845ea377ec8992256016881dd3e358cbcc3cd125e2b7fe7bdb9d2"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.21/cmduse-0.7.21-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9da1f26dba4f0f189e211c2623a472b425a9ee1fc9e32bf086cbdff83f960f55"
    end
  end

  def install
    bin.install "cmduse", "ocuse", "arkuse", "cmdusedev", "arkusedev"
    man1.install "cmduse.1"
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse -V")
    assert_match "ocuse", shell_output("#{bin}/ocuse -V")
    assert_match "arkuse", shell_output("#{bin}/arkuse -V")
  end
end
