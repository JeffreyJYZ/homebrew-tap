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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.5/cmduse-0.8.5-aarch64-apple-darwin.tar.gz"
      sha256 "1007179f7ec54f0d990878a6a42a381cf8cfb6b3744853358b2ed806dc8efb13"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.5/cmduse-0.8.5-x86_64-apple-darwin.tar.gz"
      sha256 "5f675b89f66f51be037c9b87ee8768c06d5ab6fc54c2072ded815ed0215b0bc3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.5/cmduse-0.8.5-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5cd56b7b8b6890e53952886e54bf11f9924850f804dab964d1ea7e6f1bd4aa49"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.5/cmduse-0.8.5-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1d61a53f3529ba5e1f527f120a672866da54f06aebc4be1440bb86568b200650"
    end
  end

  def install
    bin.install "cmduse", "ocuse", "arkuse", "oduse", "cmdusedev", "ocusedev", "arkusedev", "odusedev"
    man1.install "cmduse.1"
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse -V")
    assert_match "ocuse", shell_output("#{bin}/ocuse -V")
    assert_match "arkuse", shell_output("#{bin}/arkuse -V")
    assert_match "oduse", shell_output("#{bin}/oduse -V")
  end
end
