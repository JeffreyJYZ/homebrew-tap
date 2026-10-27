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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.30/cmduse-0.7.30-aarch64-apple-darwin.tar.gz"
      sha256 "1204dcb710bba1a802e99ac6b5b1a5e8318ae3c783d576a0bec9de58c3b7750c"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.30/cmduse-0.7.30-x86_64-apple-darwin.tar.gz"
      sha256 "0e160dceb38efc6e75be213121e56b4aabf6e6b87f24c13a09bee00a7737a4f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.30/cmduse-0.7.30-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4a5ebb5dec11569d6d02aa24e5dafe463a04bbbf7c2f6329f63673dd4ebad84b"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.30/cmduse-0.7.30-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e650b42557e4d9714d9ee99cd0a96eace732cf1d94bf838a2f5ef497a5535324"
    end
  end

  def install
    bin.install "cmduse", "ocuse", "arkuse", "cmdusedev", "ocusedev", "arkusedev"
    man1.install "cmduse.1"
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse -V")
    assert_match "ocuse", shell_output("#{bin}/ocuse -V")
    assert_match "arkuse", shell_output("#{bin}/arkuse -V")
  end
end
