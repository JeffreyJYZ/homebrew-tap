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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.31/cmduse-0.7.31-aarch64-apple-darwin.tar.gz"
      sha256 "1d9fc5ec75d1133f04c7ff9c781ccc7bf50e3cfd6c39e3496b07eef92c6fc45b"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.31/cmduse-0.7.31-x86_64-apple-darwin.tar.gz"
      sha256 "abed31c00929d034d1381117e8763d9b8784f15da58b839678be89894b9492f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.31/cmduse-0.7.31-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d6ec64f03b0ec2741c1c8fe881fa485dca4a04dee8023c510f5fd1c010e3a813"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.31/cmduse-0.7.31-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ae6147eedc0919ac3dc11d248e017b891633765f738c1fd67b858f91877d43cc"
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
