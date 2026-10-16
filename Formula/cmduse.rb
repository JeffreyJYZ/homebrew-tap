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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.11/cmduse-0.7.11-aarch64-apple-darwin.tar.gz"
      sha256 "fdae88b15ee13043b84773c45239e7104988c5e9e1868282ddd19d73921cc6e1"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.11/cmduse-0.7.11-x86_64-apple-darwin.tar.gz"
      sha256 "545e0daf2915c0b107c64f37de1f95ddcb88c56155f2d7ab8d598c5f4f775f15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.11/cmduse-0.7.11-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3a324cfd370ba5c3219f1b1f3a5397d7c4b876c39c5ffd89b41a69dceed57c6d"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.11/cmduse-0.7.11-x86_64-unknown-linux-musl.tar.gz"
      sha256 "94162bf71ed8a7ab73cceaa3fe8b79eaa93881c5d5ca1f8fa9b71c0baca89538"
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
