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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.12/cmduse-0.7.12-aarch64-apple-darwin.tar.gz"
      sha256 "0fd1719c276ef11ba876cd069e1625e9813f9dbc4efd17c4767affb4917b33cf"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.12/cmduse-0.7.12-x86_64-apple-darwin.tar.gz"
      sha256 "c853a61d4f02b2275f7a04de3c24812f5700af927f018f95ad427c7e6456b833"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.12/cmduse-0.7.12-aarch64-unknown-linux-musl.tar.gz"
      sha256 "65950df816c343fe3146c7e87f01b2ec04a61b8dacc8e159c195fadd5a08fd50"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.12/cmduse-0.7.12-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c315f3c01158822a721eacfebcc8bf70b5ee6fce141a3cf2a4637e53381c4b27"
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
