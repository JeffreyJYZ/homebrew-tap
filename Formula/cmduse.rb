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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.15/cmduse-0.7.15-aarch64-apple-darwin.tar.gz"
      sha256 "bad879bf7fd03eaed3f62a07769aaa07a43653990afa81d0e9e0d09631667489"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.15/cmduse-0.7.15-x86_64-apple-darwin.tar.gz"
      sha256 "18474480ee1d3f73da1e79b4c5f8881adb5229a679cf2102dd39017b6d859dbc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.15/cmduse-0.7.15-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4cca553720e4dc7e19d6ccf73fa3b99f0e1ef6169190b1e03a57f2772e7ae265"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.15/cmduse-0.7.15-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ede61728421cb48308ec8c821de67f8f88430f8f0c72c2cabe6a2c412e9c42ba"
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
