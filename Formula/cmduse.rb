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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.2/cmduse-0.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "3345c1c7d65ad0d7edf28f053d7a8d5ff3b9cc14323905d277a8dca416487ad2"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.2/cmduse-0.8.2-x86_64-apple-darwin.tar.gz"
      sha256 "73d8edbe3f3f8ca4cf85ab93d83cb676b6b88ea624147b06dd9cd00c811061fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.2/cmduse-0.8.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e494da9836d286c21e372d10d8d0f7ebcdb0069b99f778c957c16a9a5d8d2ea4"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.2/cmduse-0.8.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ac34dfaced63f59194391746a23c3a120bb6f77c920d484b7cec20617aa30a3d"
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
