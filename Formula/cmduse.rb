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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.16/cmduse-0.7.16-aarch64-apple-darwin.tar.gz"
      sha256 "c4aa74b5cb973f8e594508afa2d7bd2ab2fcf225a66f5b8f434fe8b0119fd8f6"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.16/cmduse-0.7.16-x86_64-apple-darwin.tar.gz"
      sha256 "a8ca1641594307e8bd2a2c1e123150aeaa0c5a71f561ce4677e0ac000b02e1d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.16/cmduse-0.7.16-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8ea802ad2f5268981341c5866d30cadd46122d0e3e88f6c6bc14eacba3d697ed"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.16/cmduse-0.7.16-x86_64-unknown-linux-musl.tar.gz"
      sha256 "57f4c47d69ad0636f23f425de91e027b1636aaa5ecf6841386309d2ac2b26283"
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
