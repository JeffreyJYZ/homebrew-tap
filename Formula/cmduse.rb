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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.0/cmduse-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "9b3a38b232d444b7dd213d6f8c5594dd50c5d101e7ae99999913ce79bae7266e"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.0/cmduse-0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "788f157f2e7b52dd11be1c1691685abb30318dbe0b8e0aedd6071cdac935b882"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.0/cmduse-0.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "80090190b49bdd59d4e4d2d6b5dcbcda1b67d5fab37dc2c2c1444a4593bee55c"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.0/cmduse-0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4d13b6fa7b0eea3cb4917a0bf9b12f6affae4a03f46ae5a739265643ccff3fb8"
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
