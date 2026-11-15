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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.35/cmduse-0.7.35-aarch64-apple-darwin.tar.gz"
      sha256 "10ce3fb3031952d784d2b874e3b523e32ff237e90a29b42acbd8a5620ed29fa1"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.35/cmduse-0.7.35-x86_64-apple-darwin.tar.gz"
      sha256 "9add409f2eb02b01c47e0ad24134a81b2d3c52b4583201446aaffa4ca14ac33c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.35/cmduse-0.7.35-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b96ac302f54dd8c7a071bad13a2b8547c5d313df52d52486829c2d73b89f6cbf"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.35/cmduse-0.7.35-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cfe598a6e635a305a1129db6d9da358ab124302484570c629b18023a8dee4223"
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
