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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.29/cmduse-0.7.29-aarch64-apple-darwin.tar.gz"
      sha256 "53f01e4e1a869be24372ff1091bd74db50793c453472ad9c0b699463ed865ba3"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.29/cmduse-0.7.29-x86_64-apple-darwin.tar.gz"
      sha256 "5fb7dc3d39299be482e8de21d78be0c900ea344e70e883dc0414d7d58968abf8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.29/cmduse-0.7.29-aarch64-unknown-linux-musl.tar.gz"
      sha256 "acdc210a64e0f07814ce323bcaacd794eefc2d5ed89db6c36b28d2be7baea12a"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.29/cmduse-0.7.29-x86_64-unknown-linux-musl.tar.gz"
      sha256 "97debaacc07043d633d82ebb9b35a9aabbab680ed3d3405997ac46ace1fd97d3"
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
