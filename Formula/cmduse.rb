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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.8/cmduse-0.7.8-aarch64-apple-darwin.tar.gz"
      sha256 "e47caa66064a90ea5cde6effd63f8773ff67188061460c61a54a072b86a6cc94"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.8/cmduse-0.7.8-x86_64-apple-darwin.tar.gz"
      sha256 "ad041120a48c66075b27b1d756e2eaac73be3ed2d63e046310be32757dac77ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.8/cmduse-0.7.8-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1c58509e86f9490d2f4d4182efabc5f4993a83f31eda5e7d03742efd5e8eb0fb"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.8/cmduse-0.7.8-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7d7863e0e8e77d0ca4f243aee7186b4c22fe750a4776b136994e97180e39f78d"
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
