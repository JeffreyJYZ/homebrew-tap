class Cmduse < Formula
  desc "Live Command Code usage dashboard: plan, credits, windows, reports"
  homepage "https://github.com/JeffreyJYZ/command-code-zed"
  license "MIT"

  # Prebuilt release assets — no cargo, no Rust toolchain, no compile step.
  # Asset names are a contract shared with `cargo binstall` metadata (see
  # .github/workflows/release.yml in the source repo); Linux uses the musl
  # builds because they run on any distro regardless of glibc version.
  on_macos do
    on_arm do
      url "https://github.com/JeffreyJYZ/command-code-zed/releases/download/cmduse-v0.7.6/cmduse-0.7.6-aarch64-apple-darwin.tar.gz"
      sha256 "f76c8ab6f8be04b44350eb490447da1880d2b84f18be75aebf686f81f90dfee2"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/command-code-zed/releases/download/cmduse-v0.7.6/cmduse-0.7.6-x86_64-apple-darwin.tar.gz"
      sha256 "ecb3d51b1ca9703b52028c3c39daf69e0dfff1def66f4662c3c3e17356ea08aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/command-code-zed/releases/download/cmduse-v0.7.6/cmduse-0.7.6-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a7e2c31fa094a607f04cf8c5840033f371ebe44508a38a483114898ce7d14f8c"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/command-code-zed/releases/download/cmduse-v0.7.6/cmduse-0.7.6-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6f173a998002c37ada2d4828f163672f1fa05686c360e74f256d835a30736693"
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
