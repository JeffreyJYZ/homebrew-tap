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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.4/cmduse-0.8.4-aarch64-apple-darwin.tar.gz"
      sha256 "0653f571cae774459bdf8700d5d0c05819a91a66a67320a492c56ab81505efc4"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.4/cmduse-0.8.4-x86_64-apple-darwin.tar.gz"
      sha256 "506a48f34c102c88ddbd178755c86a9a42586f84fb1a3f4846e21e28d12f491f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.4/cmduse-0.8.4-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5d36cd7e2f5aaab5727e0e2282dddafe0be5895efbd3a3edc704eaf7932241c8"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.4/cmduse-0.8.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d3ddf6de914f1a1652d8878ac423e94de8e56df67484428ed1384860b908b82c"
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
