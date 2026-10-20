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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.22/cmduse-0.7.22-aarch64-apple-darwin.tar.gz"
      sha256 "2f16700fde5aecd0101934bece8e463ad2c5fe7781d1d69a54cab2c1cba7e5f0"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.22/cmduse-0.7.22-x86_64-apple-darwin.tar.gz"
      sha256 "a8dfddd20808cd74ab51a16235f3ffcf1e2e3c4584a2980bc61a023985451a98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.22/cmduse-0.7.22-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c915b9c43e37e72b522cc06d779ff286e648b27dbc8a88f9a146ac1eb69b833f"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.22/cmduse-0.7.22-x86_64-unknown-linux-musl.tar.gz"
      sha256 "32fd3560f5625907acbf4cb74692f8f0df1f60ef23ebc0c4f936dde86b12031a"
    end
  end

  def install
    bin.install "cmduse", "ocuse", "arkuse", "cmdusedev", "arkusedev"
    man1.install "cmduse.1"
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse -V")
    assert_match "ocuse", shell_output("#{bin}/ocuse -V")
    assert_match "arkuse", shell_output("#{bin}/arkuse -V")
  end
end
