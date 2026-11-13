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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.33/cmduse-0.7.33-aarch64-apple-darwin.tar.gz"
      sha256 "9768c0393767442635e2004d17a43b25f3e702333a8c0fe8e48c94c4e867d429"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.33/cmduse-0.7.33-x86_64-apple-darwin.tar.gz"
      sha256 "a3f1efc8da684a159aa0531fc545238614e8dd93d4015c97956dfa2f43affc0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.33/cmduse-0.7.33-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1c9d08ed067bb2038570e3de7ad067935f14c219922620b98dd76c2fa44a14ad"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.33/cmduse-0.7.33-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f45f5aca5f6e3b76ab1055488b4b48acbade84f11a7045e79cffa846151709b9"
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
