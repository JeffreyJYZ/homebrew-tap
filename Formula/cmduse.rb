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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.14/cmduse-0.7.14-aarch64-apple-darwin.tar.gz"
      sha256 "8a5c715ab0ca0e494c99441e49f876dc31111fe210184c58bdc8d47ac9128732"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.14/cmduse-0.7.14-x86_64-apple-darwin.tar.gz"
      sha256 "6612f2aa393d16d5f2fcea2b632c96b9d0a39b3174e48dc15e152a829b629452"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.14/cmduse-0.7.14-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e514dee6aab4fcb6d5b35bac6b1ad3f2faff9d2914cfbfa3d09900e74c767324"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.14/cmduse-0.7.14-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5f1bd09ecaffea66c5fa2e96d52ca2a8d69d17410caf8cb060ec7eb68744f45e"
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
