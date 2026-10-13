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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.9/cmduse-0.7.9-aarch64-apple-darwin.tar.gz"
      sha256 "81606face82331b77738bf8b3630ea0064837b5b07acb5d5c51fd8637b27a2b5"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.9/cmduse-0.7.9-x86_64-apple-darwin.tar.gz"
      sha256 "120afa33a4faa70c9f38f1ef225e8695f69a98eb5d61aba6aff5973d3e809cae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.9/cmduse-0.7.9-aarch64-unknown-linux-musl.tar.gz"
      sha256 "321044b70455f4e7097322ed48490f9c4a69251b7fc1866834bee51e496f03de"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.9/cmduse-0.7.9-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d895e003e561c548ec4976754f08998645589758e8f0a0c5ec3279038e6e1e04"
    end
  end

  def install
    bin.install "cmduse", "ocuse", "cmdusedev"
    man1.install "cmduse.1"
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse -V")
    assert_match "ocuse", shell_output("#{bin}/ocuse -V")
  end
end
