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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.13/cmduse-0.7.13-aarch64-apple-darwin.tar.gz"
      sha256 "84588169022a0443343e78bade988e37f3c7931ead376e49d3bd41716b0e913a"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.13/cmduse-0.7.13-x86_64-apple-darwin.tar.gz"
      sha256 "cc04ea764bacbbe08dbcbc8412b09b8b017276b4e1ea217169ebc1e58ef801fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.13/cmduse-0.7.13-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9de088b6c619c49368b3360a9d0df5503bb44a27e73aac2cff5e6ed3f1b01b84"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.13/cmduse-0.7.13-x86_64-unknown-linux-musl.tar.gz"
      sha256 "33f8b2a91317c9d488e31f2a14ca8be6eec35eb1034f2512f6fe18dd4d28033e"
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
